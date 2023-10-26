import { useState, useEffect } from 'react';
import "../../../static/css/Zonesoft.css"
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
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