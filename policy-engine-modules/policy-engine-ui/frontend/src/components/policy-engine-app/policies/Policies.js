import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
import Attributes from "../attributes/Attributes";
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';


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
	
	const onAssignPolicyHandler = (event) =>{
		console.log("FROM Policies.onAssignPolicyHandler, event=", event);
		alert("FROM Policies.onAssignPolicyHandler");
	}
	
	return (
		<div className = { styles.accordion } >
			 {(assetType) ? <span className='indent'>Polices applied to <b>{assetType.name}</b></span>  : <p>-- asset type not available --</p>}
			<Accordion>
				{policies.map(p =>
					<AccordionItem header={p.name} label="Policy" description={p.description} key={p.id}>
						<div className='indent'>
							{<Attributes policy={p}/>}
						</div>
					</AccordionItem>
				)}
				<PoliciesPickList onAssign={onAssignPolicyHandler}/>
			</Accordion>
		</div>
	)
}

const AssignPolicy = (props) => {		
	return (
			<AccordionItem header="" onClick={props.onClick} label={"-- click to assign another policy --"} description="" key={-1}></AccordionItem>
	);
}

const PoliciesPickList = (props) => {
	return (
			<Popup 
				trigger={open => <AssignPolicy onClick={open} />}
				modal
				nested
			>
				<span> Popup content </span>
			</Popup>
	);	
}