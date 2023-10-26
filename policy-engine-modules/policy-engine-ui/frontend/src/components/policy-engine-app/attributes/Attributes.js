import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
// import Policies from "../policies/Policies";

function Attributes(props) {
	const ENTITY_NAME = "attribute";
	const [attributes, setAttributes] = useState([]);
	const [policy, setPolicy]= useState(null);
				
	useEffect(() => {
		if(props.policy){			
			const getAttributeIdsFromPolicy = (policy) =>{		
				return policy.associatedAttributes.map(a => a.id);
			}
			setPolicy(props.policy);
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getAttributeIdsFromPolicy(props.policy)).then((data) => setAttributes(data));						
		}else{
			setPolicy(null);
			setAttributes([]);
		}
	}, [props.policy]);	
	
			
	return (
		<div className = { styles.accordion } >
			 {(policy) ? <span>Attributes for <b>{policy.name}</b> policy</span>  : <p>-- no policy assigned --</p>}
			<Accordion>
				{attributes.map(a =>
					<AccordionItem header={a.name} label="Attribute" description={a.description} key={a.id}>
					</AccordionItem>
				)}
			</Accordion>
		</div>
	);
}

export default Attributes;