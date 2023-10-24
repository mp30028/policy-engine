import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../../../static/css/Zonesoft.css"
import DataService from "../../data-services/DataServiceClass";
import ApiClientConfigs from "../../configurations/ApiClientConfigsClass";

function Policies(props) {
	const ENTITY_NAME = "policy";
	const emptyPolicies = [];
	const [policies, setPolicies] = useState(emptyPolicies);
	const [selected, setSelected]= useState(null);
	
	useEffect(() => {
		const getAssociatedPolicyIdsFromAssetTypes = (assetTypes) =>{
			const deDupe = (inArray) => [...new Set(inArray)];		
			const policyIds = assetTypes.flatMap(at => (at.associatedPolicies).map(p => p.id));
			return deDupe(policyIds);
		}
				
		if(props.selectedAssetTypes){
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getAssociatedPolicyIdsFromAssetTypes(props.selectedAssetTypes)).then((data) => setPolicies(data));						
		}else{
			console.warn("Policies:useEffect:props.selectedAssetTypes is not set");
			setPolicies([]);
		}
	}, [props.selectedAssetTypes]);	

	useEffect(() => {		
		setSelected((selected)? policies.find(p => p.id === selected.id) : null);
	}, [policies,selected]);
	
	useEffect(() => {
		props.selectedPolicySetter(selected);
	}, [props, selected]);
	
	const onAddNewClick = () =>{
		//to-do
	}
	
	const onSelectionChange = (event) =>{
		selectHandler(event, policies, selected, setSelected);				
	}
		
	const isChecked = (id) =>{		
		const getTargetDataItem = () => {
			return policies.find(x => x.id === id);	
		};		
		return isSelected(selected, getTargetDataItem());
	}	
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th></th>
					<th>ID</th>
					<th>Policy</th>
					<th>Description</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				{policies.map(p =>
					<tr key={p.id}>
						<td>
							<input type="checkbox" name={ENTITY_NAME + "-selector-" + p.id} id={ENTITY_NAME + "-selector-" + p.id}  value={p.id} onChange={onSelectionChange} checked={isChecked(p.id)} />
						</td>					
						<td>{p.id}</td>
						<td>{p.name}</td>
						<td>{p.description}</td>
						<td className="ellipses">...</td>
					</tr>										
				)}
				<tr>
					<td colSpan={5}  style={{textAlign:"right"}}>
						<button type="button" onClick={onAddNewClick}>Add New</button>
					</td>
				</tr>				
			</tbody>
		</table>
	);
};

	const isSelected = (selected, targetDataItem) =>{	
		if (selected){
			return (selected.id === targetDataItem.id);
		}else{
			return false;
		} 
	};

	const selectHandler = (event, data,selected, setSelected) =>{
		const getTargetDataItem = () => {
			return data.find(x => x.id === parseInt(event.target.value));	
		};
				
		const targetDataItem = getTargetDataItem();
		
		if (targetDataItem){
			if (isSelected(selected, targetDataItem)){
				setSelected(null);	
			}else{
				setSelected(targetDataItem);
			}			
		}else{
			setSelected(null);
		}	
	};

export default Policies;