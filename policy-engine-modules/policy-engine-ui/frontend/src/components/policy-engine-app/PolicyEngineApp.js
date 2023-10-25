import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../configurations/ApiClientConfigsClass";
import DataService from "../../data-services/DataServiceClass";
import AccordionItem from './accordion/AccordionItem';
import styles from "../../static/css/accordion.module.css";
//import Policies from "./policies/Policies";

function PolicyEngineApp() {
	const ENTITY_NAME = "assetType";
	const [assetTypes, setAssetTypes] = useState([]);
			
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
			
	return (
		<div className={styles.accordion}>
			<Accordion allowMultiple >
				{assetTypes.map(at => 							
					<AccordionItem header={at.name} label="Asset-Type" description={at.description} key={at.id}>						
						---- Policies for the Asset-Type above to go here -----
						{/*<Policies />*/}							
					</AccordionItem>
				)}
			</Accordion>
		</div>
	);
}

export default PolicyEngineApp;