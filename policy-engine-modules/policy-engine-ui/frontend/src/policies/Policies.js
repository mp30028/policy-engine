import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../css/Zonesoft.css"
import * as DataService from "./DataService";

function Policies(props) {
	const ENTITY_NAME = "policy";
	const emptyPolicies = [];
	const [policies, setPolicies] = useState(emptyPolicies);
	const [selected, setSelected]= useState([]);
	
	useEffect(() => {
		const getAssociatedPolicyIdsFromAssetTypes = (assetTypes) =>{
			const deDupe = (inArray) => [...new Set(inArray)];		
			const policyIds = assetTypes.flatMap(at => (at.associatedPolicies).map(p => p.id));
			console.log("FROM getAssociatedPolicyIdsFromAssetTypes: policyIds = ", policyIds)
			return deDupe(policyIds);
		}
				
		if(props.selectedAssetTypes){		
			DataService.fetchByIds(getAssociatedPolicyIdsFromAssetTypes(props.selectedAssetTypes)).then((data) => setPolicies(data));
		}else{
			console.warn("Policies:useEffect:props.selectedAssetTypes is not set");
		}
	}, [props.selectedAssetTypes]);	
	
	const onAddNewClick = () =>{
		//to-do
	}
	
	const onSelectionChange = (event) =>{
		selectHandler(event, policies, setSelected);				
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
		return (selected.id === targetDataItem.id);
	};

	const selectHandler = (event, data, setSelected) =>{
		const getTargetDataItem = () => {
			return data.find(x => x.id === parseInt(event.target.value));	
		};
				
		const targetDataItem = getTargetDataItem();
		
		if (targetDataItem){
			setSelected(targetDataItem);
		}else{
			targetDataItem(null);
		}	
	};

export default Policies;