import React, {useEffect, useState } from 'react';
import { Accordion, AccordionItem} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../classes/data-services/DataService.class";
import Logger from '../../classes/logger/Logger.class';
import styles from "./css/ManageAssetTypes.module.css";
import chevronDown from "../../static/icons/chevron-down.svg";

function ManageAssetTypes() {
	const MODULE = 	"ManageAssetTypes";
	const LOGGER = new Logger().getLogger(MODULE);			
	const ENTITY_NAME = "assetType";
	const [assetTypes, setAssetTypes] = useState([]);
			
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
		LOGGER.debug("Data fetched successfully")
	}, [setAssetTypes, LOGGER]);
			
	return (
			<Accordion allowMultiple className={styles.accordion}>
				{assetTypes.map(at =>
					<AccordionItem
						header={<AccordionItemHeader assetType={at}/>}				
						headingProps={{ className: styles.header }}
						buttonProps={{ className: ({ isEnter }) => `${styles.button} ${isEnter && styles.buttonExpanded}` }}
						className={styles.item}
						key={at.id}
					>
						<AccordionItemContent assetType={at} className={styles.content}/>
					</AccordionItem>									
				)}				
			</Accordion>
	);
}


const AccordionItemHeader = (props) => {			
	return (
		<>
			{(props.assetType) ?							
				<span className={styles.headerContainer}>
					<span className={styles.label}>Asset-Type- 
						<span className={styles.id}>{props.assetType.id}</span>
					</span>								 
					<span className={styles.content}>{props.assetType.name}</span>
					<span className={styles.info}>{props.assetType.description}</span>
					<img src={chevronDown} alt="Chevron Down" className={styles.chevron}/>									
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
			<span>Policy details go here</span>
		</>
	);	
}

export default ManageAssetTypes;