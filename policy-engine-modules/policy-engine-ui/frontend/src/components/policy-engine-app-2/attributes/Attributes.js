import { useState, useEffect } from 'react';
import "../../../static/css/Zonesoft.css"
import DataService from "../../../data-services/DataServiceClass";
import ApiClientConfigs from "../../../configurations/ApiClientConfigsClass";
import View from './View';

function Attributes(props) {
	const ENTITY_NAME = "attribute";
	const view = new View();
	 
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
			setAttributes([]);
		}
	}, [props.selectedPolicy]);		
	
	return view.getView(attributes);
}

export default Attributes;