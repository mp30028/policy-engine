import React, {useEffect, useState } from 'react';
import ApiClientConfigs from "../../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../../classes/data-services/DataService.class";
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';
import styles from "../accordion-item/accordion.module.css";
import Logger from '../../../../classes/logger/Logger.class';

const PickList = React.forwardRef( (props, ref) => {
	const LOGGER = new Logger().getLogger("AT_Policies_PickList");
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

export default PickList;