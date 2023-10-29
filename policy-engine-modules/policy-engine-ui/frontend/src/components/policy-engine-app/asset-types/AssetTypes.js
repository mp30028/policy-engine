import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
import Policies from "../policies/Policies";

function AssetTypes() {
	const ENTITY_NAME = "assetType";
	const [assetTypes, setAssetTypes] = useState([]);
	const [isSavePending, setIsSavePending] = useState(false);
			
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
	
	const onDataChangeHandler = (change) =>{
		console.log("FROM AssetTypes.onDataChangeHandler, update.type", change.type, 'update.data=', change.data );
		var updated = null;
		switch (change.type){
			case 'UPDATE':
				console.log("FROM AssetTypes.onDataChangeHandler, case 'UPDATE'");
				updated = assetTypes.map((at) => (at.id === change.data.id) ? change.data : at);
				break;
			case 'DELETE':
				console.log("FROM AssetTypes.onDataChangeHandler, case 'DELETE'");
				updated = assetTypes.map((at) => (at.id === change.data.id) ? null : at);				
				break;
			case 'ADD-NEW':
				console.log("FROM AssetTypes.onDataChangeHandler, case 'ADD-NEW'");
				updated = [...assetTypes, change.data];
				break;
			default:
				console.log("FROM AssetTypes.onDataChangeHandler, Something very unexpected has  happened.");
		}
		if (updated) setAssetTypes(updated);
		setIsSavePending((updated)? true : false);
	}
	
	const onSaveAllHandler = () => {
		setIsSavePending(false);
	}
			
	return (
		<div className={styles.accordion}>
			<Accordion allowMultiple >
				{assetTypes.map(at => 							
/*					<AccordionItem assetType={at} onDataChange={onDataChangeHandler}   label="Asset-Type" key={at.id}> */
/*					<AccordionItem assetTypeIn={at} label="Asset-Type" key={at.id}> */
					<AccordionItem assetTypeIn={at} onDataChange={onDataChangeHandler}   label="Asset-Type" key={at.id}>

						<Policies assetType={at} />
						<hr style={{ width: "1000px", marginLeft: "0" }} />
					</AccordionItem>					
				)}
			</Accordion>
			{isSavePending && <SaveAllButton onSave={onSaveAllHandler} data={assetTypes} />}
		</div>
	);
}

const SaveAllButton = (props) =>{
	
	const saveAllOnClick = (event) =>{
		console.log("FROM AssetTypes.saveAllOnClick, event=", event);
		props.onSave();
	}
		
	return (
		<input type='button' name='saveAll' id='saveAll' onClick={saveAllOnClick} value='Commit All Changes'/>
	); 	
}

export default AssetTypes;