import React, {useEffect, useState } from 'react';
import ApiClientConfigs from "../../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../../classes/data-services/DataService.class";
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';
import styles from "../../css/ManageAssetTypes.module.css";
import Logger from '../../../../classes/logger/Logger.class';

const PickList = React.forwardRef( (props, ref) => {
	const MODULE = 	"ManageAssetTypes.Policies.PickList";
	const LOGGER = new Logger().getLogger(MODULE);
	const ENTITY_NAME = "policy";	
	const [allPolicies, setAllPolicies] = useState([]);
	const [selectedPolices, setSelectedPolicies] = useState([]);
	
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAllPolicies(data));		
	}, [ENTITY_NAME]);	
	
	useEffect(() =>{
		const updateSelectedPolicies = (all, currentlySelected) =>{
			const updatedSelected = (all.filter(p => currentlySelected.find((q) => q.id === p.id)));
			setSelectedPolicies(updatedSelected);
		};
		
		updateSelectedPolicies(allPolicies, props.currentlySelectedPolices);
	},[props.currentlySelectedPolices, allPolicies])
	
	const isSelected = (id) => {
		LOGGER.debug("FROM Policies.PoliciesPickList.isSelected id=", id);
		const findResult = selectedPolices.find((p) => (p.id === id));
		var returnValue = ((findResult) ? true : false);
		LOGGER.debug("FROM isSelected returnValue=", returnValue);
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
		LOGGER.debug("FROM Policies.onSelectionChange: id=", id, "isChecked=", isChecked);
		updateSelectedPolicies (id, isChecked);
	}

	const AssignPolicy = React.forwardRef((props, ref) => {		
		return (
			<span  style={{width:'100%'}}>
				<span onClick={props.onClick} 
					className={styles.triggerIcon} 
					title={'Manange the policies applicable to ' + props.assetType.name}
				/>
			</span>	
		)
	});
	
	return (
			<Popup 
				trigger={open => <AssignPolicy assetType={props.assetType} onClick={open} />}
				modal
				nested
			>
				<span>
					 {allPolicies.map(p =>
					 	<div key={p.id}> 
					 		{p.name} - 	{(isSelected(p.id)).toString()}
					 		<input type='checkbox' id={p.id} name={'popup-item-' + p.id} checked={isSelected(p.id)} onChange={onSelectionChange} />
					 		
					 	</div>
					 )}
				</span>
			</Popup>
	);	
})

export default PickList;