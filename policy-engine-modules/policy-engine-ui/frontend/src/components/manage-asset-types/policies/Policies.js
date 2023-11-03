import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
import Attributes from "../attributes/Attributes";
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';

export default function Policies(props) {
	const ENTITY_NAME = "policy";
	const [policies, setPolicies] = useState([]);
	
	useEffect(() => {
		if(props.assetType){			
			const getPolicyIdsFromAssetType = (assetType) =>{		
				return assetType.associatedPolicies.map(p => p.id);
			}
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getPolicyIdsFromAssetType(props.assetType)).then((data) => setPolicies(data));						
		}else{
			setPolicies([]);
		}
	}, [props.assetType]);
	
	const handlePoliciesChange = (updatedPolicies) =>{
		setPolicies(updatedPolicies);
		const updatedAssetType = props.assetType;
		updatedAssetType.associatedPolicies = updatedPolicies.map(p => ({id: p.id, name: p.name}));
		props.onDataChange({type: "UPDATE", data: updatedAssetType});
	}
		
	return (
		<div className = { styles.accordion } >
			 {(props.assetType) ? <span className='indent'>Polices applied to <b>{props.assetType.name}</b></span>  : <p>-- asset type not available --</p>}
			<Accordion>
				{policies.map(p =>
					<AccordionItem header={p.name} label="Policy" description={p.description} key={p.id}>
						<div className='indent'>
							{<Attributes policy={p}/>}
						</div>
					</AccordionItem>
				)}
				
				<PoliciesPickList 
					parentId={props.assetType.id} 
					currentlySelectedPolices={policies} 
					ENTITY_NAME={ENTITY_NAME} 
					onSelectedChange={handlePoliciesChange} 
				/>
				<br/>
			</Accordion>
		</div>
	)
}

const PoliciesPickList = React.forwardRef( (props, ref) => {
	
	const [allPolicies, setAllPolicies] = useState([]);
	const [selectedPolices, setSelectedPolicies] = useState([]);
	
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),props.ENTITY_NAME);
		dataService.fetchAll().then((data) => setAllPolicies(data));		
	}, [props.ENTITY_NAME]);	
	
	useEffect(() =>{
		const updateSelectedPolicies = (all, currentlySelected) =>{
			const updatedSelected = (all.filter(p => currentlySelected.find((q) => q.id === p.id)));
			setSelectedPolicies(updatedSelected);
		};
		
		updateSelectedPolicies(allPolicies, props.currentlySelectedPolices);
	},[props, allPolicies])
	
	const isSelected = (id) => {
		console.log("FROM Policies.PoliciesPickList.isSelected id=", id);
		const findResult = selectedPolices.find((p) => (p.id === id));
		var returnValue = ((findResult) ? true : false);
		console.log("FROM isSelected returnValue=", returnValue);
		return returnValue;
	}

	const onSelectionChange = (event) =>{
		const updateSelectedPolicies = (id, isChecked) => {
			if (isChecked){
				const updated = [...selectedPolices, allPolicies.find(p => p.id === id)]
				props.onSelectedChange(updated);
			}else{				
				const updated = selectedPolices.filter(p => (p.id !== id));
				props.onSelectedChange(updated);
			}
		}
			
		const isChecked = event.target.checked;
		const id = event.target.id ? parseInt(event.target.id) : 0;
		console.log("FROM Policies.onSelectionChange: id=", id, "isChecked=", isChecked);
		updateSelectedPolicies (id, isChecked);
	}

	const AssignPolicy = React.forwardRef((props, ref) => {		
		return (
			<div >
			      <span className={styles.addNew} onClick={props.onClick} />
			      <span className={styles.label}>Manage Assigned Policies</span>
			</div>	
					
			
		);
	})
	
	return (
			<Popup 
				trigger={open => <AssignPolicy onClick={open} />}
				modal
				nested
			>
				<span>
					 {allPolicies.map(p =>
					 	<div key={props.parenteId + '-' + p.id}> 
					 		{p.name} - 	{(isSelected(p.id)).toString()}
					 		<input type='checkbox' id={p.id} name={'popup-item-' + p.id} checked={isSelected(p.id)} onChange={onSelectionChange} />
					 		
					 	</div>
					 )}
				</span>
			</Popup>
	);	
})