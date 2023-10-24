import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../../../static/css/Zonesoft.css"
import DataService from "../../data-services/DataServiceClass";
import ApiClientConfigs from "../../configurations/ApiClientConfigsClass";

function Attributes(props) {
	const ENTITY_NAME = "attribute";
	const [attributes, setAttributes] = useState([]);

	useEffect(() => {
		const getAssociatedAttributeIdsFromPolicies = (policy) =>{
			if(policy){
				if(policy.associatedAttributes){
					return policy.associatedAttributes.map(a => a.id);	
				}else{
					return [];
				}				
			} else{
				return [];
			}			
		}
				
		if(props.selectedPolicy){
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getAssociatedAttributeIdsFromPolicies(props.selectedPolicy)).then((data) => setAttributes(data));
		}else{
			//console.warn("Policies:useEffect:props.selectedAssetTypes is not set");
			setAttributes([]);
		}
	}, [props.selectedPolicy]);		
	
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th>ID</th>
					<th>Attribute</th>
					<th>Description</th>
					<th>Manage</th>					
				</tr>
			</thead>
			<tbody>
				{attributes.map(at =>
					<tr key={at.id}>
						<td>{at.id}</td>
						<td>{at.name}</td>
						<td>{at.description}</td>
						<td className="ellipses">...</td>
					</tr>
				)}
			</tbody>
		</table>
	);
}

export default Attributes;