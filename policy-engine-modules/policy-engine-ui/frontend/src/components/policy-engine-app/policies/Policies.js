import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
//import Attributes from "./attributes/Attributes";

export default function Policies(props) {
	const ENTITY_NAME = "policy";
	const [policies, setPolicies] = useState([]);
	const [assetType, setAssetType]= useState(null);
	
	useEffect(() => {
		if(props.assetType){			
			const getPolicyIdsFromAssetType = (assetType) =>{		
				return assetType.associatedPolicies.map(p => p.id);
			}
			setAssetType(props.assetType);
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getPolicyIdsFromAssetType(props.assetType)).then((data) => setPolicies(data));						
		}else{
			setAssetType(null);
			setPolicies([]);
		}
	}, [props.assetType]);	
	
	return (
		<div className = { styles.accordion } >
			 {(assetType) ? <h3> Polices applied to {assetType.name} </h3> : <p>-- asset type not available --</p>}
			<Accordion>
				{policies.map(p =>
					<AccordionItem header={p.name} label="Policy" description={p.description} key={p.id}>
						---- Attributes for the Policy above to go here -----
						{/*<Attributes />*/}
					</AccordionItem>
				)}
			</Accordion>
		</div>
	)
}