import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
import Policies from "../policies/Policies";
//import {RIEInput} from 'riek'
//import _ from 'lodash'


function AssetTypes() {
	const ENTITY_NAME = "assetType";
	const [assetTypes, setAssetTypes] = useState([]);
			
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
	
//					<AccordionItem header={at.name} label="Asset-Type" description={at.description} assetTypeId={at.id} key={at.id}>
			
	return (
		<div className={styles.accordion}>
			<Accordion allowMultiple >
				{assetTypes.map(at => 							
					<AccordionItem assetType={at}  label="Asset-Type" key={at.id}>						
						<Policies assetType={at}/>
						<hr style={{ width: "1000px", marginLeft: "0" }} />
					</AccordionItem>
					
				)}
			</Accordion>
		</div>
	);
}

export default AssetTypes;