import React, {useEffect, useState } from 'react';
import { Accordion} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../classes/data-services/DataService.class";
import AccordionItem from './AccordionItem';
import styles from "./accordion.module.css";
import Policies from "./policies/Policies";
import Logger from '../../classes/logger/Logger.class';
import SaveAllButton from './SaveAllButton';

function ManageAssetTypes() {	
	const LOGGER = new Logger().getLogger("AssetTypes");	
		
	const ENTITY_NAME = "assetType";
	
	const [assetTypes, setAssetTypes] = useState([]);
	const [isSavePending, setIsSavePending] = useState(false);
	const [pendingChanges, setPendingChanges] = useState([]);
			
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
	
	useEffect(() =>{
		LOGGER.debug("FROM AssetTypes#useEffect[pendingChanges]: pendingChanges=", pendingChanges);
	},[pendingChanges,LOGGER])
	
	const onDataChangeHandler = (change) =>{
		var updated = null;
		LOGGER.debug("FROM AssetTypes.onDataChangeHandler, change=", change);
		switch (change.type){
			case 'UPDATE':				
				updated = assetTypes.map((at) => (at.id === change.data.id) ? change.data : at);
				break;
			case 'DELETE':
				change.data.status = 'DELETED';
				updated = assetTypes.map((at) => (at.id === change.data.id) ? null : at);				
				break;
			case 'ADD-NEW':
				updated = [...assetTypes, change.data];
				break;
			default:
				LOGGER.debug("FROM AssetTypes.onDataChangeHandler, Something very unexpected has  happened.");
		}
		if (updated) setAssetTypes(updated);
		setIsSavePending((updated)? true : false);
		updatePendingChanges(change);
	}
	
	const updatePendingChanges = (change) =>{		
		function addOrReplace(pendingChanges, change){
			const itemsToKeep = pendingChanges.filter((item) => item.data.id !== change.data.id); 
 			const updatedWithChange =  [...itemsToKeep, change];
 			return updatedWithChange;
		}
		LOGGER.debug("FROM AssetTypes.updatePendingChanges: pendingChanges=", pendingChanges);
		const updatedPendingChanges = addOrReplace(pendingChanges, change);
		LOGGER.debug("FROM AssetTypes.updatePendingChanges: updatedPendingChanges=", updatedPendingChanges);
		setPendingChanges(updatedPendingChanges);
	};
	
	const onSaveAllHandler = () => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);		
		LOGGER.debug("FROM AssetTypes.pendingChanges, pendingChanges=", pendingChanges);
		pendingChanges.forEach((change) => {
			switch (change.type){
				case 'UPDATE':
					LOGGER.debug("FROM AssetTypes.onSaveAllHandler, case 'UPDATE'");										
					dataService.update(change.data).then( (data) => LOGGER.debug("FROM AssetTypes.onSaveAllHandler, updated-data=", data));
					break;
				case 'DELETE':
					change.data.status = 'DELETED';
					LOGGER.debug("FROM AssetTypes.onSaveAllHandler, case 'DELETE'");
					//dataService.delete(change.data);				
					break;
				case 'ADD-NEW':
					LOGGER.debug("FROM AssetTypes.onSaveAllHandler, case 'ADD-NEW'");
					//dataService.addNew(change.data);
					break;
				default:
					LOGGER.debug("FROM AssetTypes.onSaveAllHandler, Something very unexpected has  happened.");
			}		
		});				
		setPendingChanges([]);
		setIsSavePending(false);
	}
			
	return (
		<div className={styles.accordion}>
			<Accordion allowMultiple >
				{assetTypes.map(at => 							
					<AccordionItem assetTypeIn={at} onDataChange={onDataChangeHandler}   label="Asset-Type" key={at.id}>
						<Policies assetType={at} onDataChange={onDataChangeHandler} />
						<hr style={{ width: "1000px", marginLeft: "0" }} />
					</AccordionItem>					
				)}
			</Accordion>
			{isSavePending && <SaveAllButton onSave={onSaveAllHandler} data={assetTypes} />}
		</div>
	);
}

export default ManageAssetTypes;