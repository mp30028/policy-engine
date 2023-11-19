import React, {useEffect, useState } from 'react';
import { Accordion, AccordionItem} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import styles from "../css/ManageAssetTypes.module.css";
import chevronDown from "../../../static/icons/chevron-down.svg";
import PickList from './picklist/PickList';
import {cloneDeep, sortBy} from "lodash";
import Logger from '../../../classes/logger/Logger.class';

export default function Policies(props) {
	const MODULE = 	"ManageAssetTypes.Policies";
	const LOGGER = new Logger().getLogger(MODULE);
	const ENTITY_NAME = "policy";
	const [policies, setPolicies] = useState([]);
	const [assetType, setAssetType] = props.dataStates;
	
	LOGGER.debug("FROM ", MODULE);
	
	useEffect(() => {
		const getPolicyIdsFromAssetType = (assetType) =>{
			return assetType.associatedPolicies.map(p => p.id);
		}
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchByIds(getPolicyIdsFromAssetType(assetType)).then((data) => setPolicies(data));
	}, [assetType]);
	
	
	const handlePoliciesChange = (updatedPolicies) =>{
		setPolicies(updatedPolicies);
		const updatedAssetType = cloneDeep(assetType);
		updatedAssetType.associatedPolicies = sortBy(updatedPolicies.map(p => ({id: p.id, name: p.name})),['id']);
		setAssetType(updatedAssetType);
	}
		
	return (
		<Accordion allowMultiple className={styles.accordion} style={{paddingLeft:'25pt', width: '75%'}}>

		
				<AccordionItem
					header={
						<PickList  
							currentlySelectedPolices={policies}
							onSelectedChange={handlePoliciesChange}
							assetType={assetType}
						/>												
					}									
					headingProps={{className: styles.header }}
					buttonProps={{ className: styles.button}}
					className={styles.item}					
					style={{borderColor: 'grey'}}
					key={0}
				>					
				</AccordionItem>
				
			{policies.map(p =>
				<AccordionItem
					header={<AccordionItemHeader policy={p}/>}				
					headingProps={{className: styles.header }}
					panelProps={{className: styles.panel}}
					contentProps={{className: styles.content}}
					buttonProps={{ className: ({ isEnter }) => `${styles.button} ${isEnter && styles.buttonExpanded}`}}
					className={styles.item}									
					style={{borderColor: 'grey'}}
					key={p.id}
				>
					<AccordionItemContent policy={p} className={styles.content} key={p.id}/>
				</AccordionItem>
			)}				
		</Accordion>
	)	
}

const AccordionItemHeader = (props) => {			
	return (
		<>
			{(props.policy) ?							
				<span className={styles.headerContainer} >
					<span className={styles.label} >Policy-{props.policy.id}:  {props.policy.name}</span>
					<span className={styles.info}>{props.policy.description}</span>
					<span className={styles.buttons}>						
						<img src={chevronDown} alt="Chevron Down" className={styles.chevron}/>
					</span>						
				</span>								
			:
				<span>
					{/* ELSE empty */}
				</span>
			}																										
		</>
	);
}

const AccordionItemContent = (props) =>{
	return (
		<>
			<span>
				<Attributes policy={props.policy} />
			</span>
		</>
	);	
}

const Attributes= (props) => {
	const ENTITY_NAME = "attribute";
	const [attributes, setAttributes] = useState([]);
				
	useEffect(() => {
		if(props.policy){			
			const getAttributeIdsFromPolicy = (policy) =>{		
				return policy.associatedAttributes.map(a => a.id);
			}
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getAttributeIdsFromPolicy(props.policy)).then((data) => setAttributes(data));						
		}else{
			setAttributes([]);
		}
	}, [props.policy]);	
	
			
	return (
		<>
			{attributes.map(a =>
				<span className={styles.headerContainer} style={{paddingLeft:'30pt', width: '75%'}} key={a.id}>
					<span className={styles.label} >Attribute-{a.id}:  {a.name}</span>
					<span className={styles.info}>{a.description}</span>									
				</span>								
			)}		
		</>
	);
}