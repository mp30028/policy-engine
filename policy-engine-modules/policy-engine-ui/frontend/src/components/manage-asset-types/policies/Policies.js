import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
import Attributes from "../attributes/Attributes";
import PickList from './PickList';

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
				
				<PickList 
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
