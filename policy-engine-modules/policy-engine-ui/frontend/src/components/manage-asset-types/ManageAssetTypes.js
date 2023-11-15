import React, {useEffect, useState } from 'react';
import { Accordion, AccordionItem} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../classes/data-services/DataService.class";
import Logger from '../../classes/logger/Logger.class';
import Policies from './policies/Policies';
import styles from "./css/ManageAssetTypes.module.css";
import chevronDown from "../../static/icons/chevron-down.svg";
import EasyEdit from "react-easy-edit";
import {isEqual, cloneDeep} from "lodash";

const ManageAssetTypes = () => {
	const MODULE = 	"ManageAssetTypes";
	const LOGGER = new Logger().getLogger(MODULE);			
	const ENTITY_NAME = "assetType";
	const [assetTypes, setAssetTypes] = useState([]);

				
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));		
	}, [setAssetTypes]);
	
	useEffect(()=>{
		LOGGER.debug("FROM ", MODULE, ".assetTypesHook: assetTypes=", assetTypes);		
	},[assetTypes, LOGGER])
	
	const dataUpdateHandler = (updatedAssetType) => {
		LOGGER.debug("FROM ", MODULE, ".dataUpdateHandler", "updatedAssetType=", updatedAssetType);
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);		
		dataService.update(updatedAssetType).then( (data) => LOGGER.debug("FROM AssetTypes.onSaveAllHandler, updated-data=", data));		
	};
	
	return (
			<Accordion allowMultiple className={styles.accordion} style={{width: '800px'}}>
				{assetTypes.map(at =>
				<>
						<AccordionItemSynchroniser assetType={at}  onDataUpdate={dataUpdateHandler} key={at.id}/>
				</>
				)}				
			</Accordion>
	);
};
export default ManageAssetTypes;



/* --------------------------------------------------------------------------------------------------- */
const AccordionItemSynchroniser = (props) => {
	const MODULE = 	"ManageAssetTypes.AccordionItemDataSynchroniser";
	const LOGGER = new Logger().getLogger(MODULE);			

	const emptyAssetType = {id:0, name: "", description:"", associatedPolicies:[]}	
	const [assetType, setAssetType] = useState(emptyAssetType);
	const [isDataChanged, setIsDataChanged] = useState(false);
	const [updatedAssetType, setUpdatedAssetType] = useState(emptyAssetType);
	
	useEffect(()=>{
		const clonedAssetType = cloneDeep(props.assetType);
		setAssetType(clonedAssetType);
	},[props.assetType])
	
		
	const onChangeHandler = (updated) =>{
		let isChanged = (!isEqual(props.assetType, updated));			
		setIsDataChanged(isChanged);		
		setUpdatedAssetType(updated);
		//setAssetType(updated);
		LOGGER.debug("FROM ", MODULE, ".onChangeHandler: assetType=", assetType, ". updated=", updated, ". isChanged=", isChanged );
	}
		
	return (
			<AccordionItem
				header={<AccordionItemHeader 
					assetType={props.assetType} 
					onDataUpdate={props.onDataUpdate}
					isDataChanged={isDataChanged}
					setIsDataChanged={setIsDataChanged}
					updatedAssetType={updatedAssetType}
					setUpdatedAssetType={setUpdatedAssetType}
					onChange={onChangeHandler}
				/>}				
				headingProps={{ className: styles.header }}
				panelProps={{className: styles.panel}}
				buttonProps={{ className: ({ isEnter }) => `${styles.button} ${isEnter && styles.buttonExpanded}` }}
				contentProps={{className: styles.content}}
				className={styles.item}
				key={props.assetType.id}
			>
				<AccordionItemContent 
					assetType={props.assetType}
					onDataUpdate={props.onDataUpdate}
					isDataChanged={isDataChanged}
					setIsDataChanged={setIsDataChanged}
					updatedAssetType={updatedAssetType}
					setUpdatedAssetType={setUpdatedAssetType}
					onChange={onChangeHandler}					
				 />
			</AccordionItem>
	);	
}


/* --------------------------------------------------------------------------------------------------- */
const AccordionItemHeader = (props) => {
	const MODULE = 	"ManageAssetTypes.AccordionItemHeader";
	const LOGGER = new Logger().getLogger(MODULE);			

	const emptyAssetType = {id:0, name: "", description:"", associatedPolicies:[]}	
	const [assetType, setAssetType] = useState(emptyAssetType);
//	const [isDataChanged, setIsDataChanged] = useState(false);
//	const [updatedAssetType, setUpdatedAssetType] = useState(emptyAssetType);
	
	useEffect(()=>{
		const clonedAssetType = cloneDeep(props.assetType);
		setAssetType(clonedAssetType);
	},[props.assetType])
	
		
//	const onChangeHandler = (updated) =>{
//		let isChanged = (!isEqual(props.assetType, updated));			
//		setIsDataChanged(isChanged);		
//		setUpdatedAssetType(updated);
//		setAssetType(updated);
//		LOGGER.debug("FROM ", MODULE, ".onChangeHandler: assetType=", assetType, ". updated=", updated, ". isChanged=", isChanged );
//	}
	
	
	const onSaveHandler = () =>{
		LOGGER.debug("FROM ", MODULE, ".onSaveHandler: assetType=", assetType, ". updatedAssetType=", props.updatedAssetType);
		props.onDataUpdate(props.updatedAssetType);
		props.setUpdatedAssetType(emptyAssetType);
		props.setIsDataChanged(false);
	}
	
	const onCancelHandler =() =>{
		props.setUpdatedAssetType(emptyAssetType);
		const clonedAssetType = cloneDeep(props.assetType);
		setAssetType(clonedAssetType);
		props.setIsDataChanged(false);
		LOGGER.debug("FROM ", MODULE, ".onCancelHandler: assetType=", assetType, ". updatedAssetType=", props.updatedAssetType);
	}
	
	return (
		<span className={styles.headerContainer}>
			<span className={styles.label}>Asset-Type- 
				<span className={styles.id}>{assetType.id}</span>
			</span>								 
			<span className={styles.content}>						
				<TextEdit assetTypeProperty="name" assetType={assetType} onChange={props.onChange} />
			</span>
			<span className={styles.info}>
				<TextEdit assetTypeProperty="description" assetType={assetType} onChange={props.onChange} />
			</span>			
			<span className={styles.buttons}>
				<SaveCancelButtons isDataChanged={props.isDataChanged} onSave={onSaveHandler} onCancel={onCancelHandler} />
				<img src={chevronDown} alt="Chevron Down" className={styles.chevron}/>
			</span>															
		</span>
	);
}



/* --------------------------------------------------------------------------------------------------- */
const AccordionItemContent = (props) =>{
	const MODULE = 	"ManageAssetTypes.AccordionItemContent";
	const LOGGER = new Logger().getLogger(MODULE);		
	LOGGER.debug("FROM ", MODULE, "props.assetType=", props.assetType);
//	const onChangeHandler = (updated) =>{
//		LOGGER.debug("FROM ", MODULE, ".onChangeHandler: props.assetType=", props.assetType);
////		props.assetTypeUpdater(updated);
//	}
		
	return (
		<>
			<Policies assetType={props.assetType} updatedAssetType={props.updatedAssetType} onChange={props.onChange}/>
		</>
	);	
}



/* --------------------------------------------------------------------------------------------------- */
const TextEdit = (props) => {
	const MODULE = 	"ManageAssetTypes.TextEdit";
	const LOGGER = new Logger().getLogger(MODULE);			
	const emptyAssetType = {id:0, name: "", description:"", associatedPolicies:[]}		
	const [assetType, setAssetType] = useState(emptyAssetType);
	
	useEffect(()=>{
		setAssetType(props.assetType);
	},[props.assetType])
	
	const save = (newValue) => {		
		LOGGER.debug("FROM ", MODULE, ".save: newValue=", newValue);
		const updatedAssetType = cloneDeep(assetType);
		updatedAssetType[props.assetTypeProperty] = newValue;
		setAssetType(updatedAssetType);
		props.onChange(updatedAssetType);
		LOGGER.debug("FROM ", MODULE, ".save: updatedAssetType=", updatedAssetType);
	};

	const cancel = () => {
		LOGGER.debug("FROM ", MODULE, ".cancel");		
	};		
		
	return (
		<span onClick={event => event.stopPropagation()}>
			<EasyEdit
				type="text"
				value={assetType[props.assetTypeProperty]}
				onSave={(newValue) => save(newValue)}
				onCancel={cancel}
				saveOnBlur={true}
				hideSaveButton={true}
				hideCancelButton={true}
				saveButtonLabel=""
				cancelButtonLabel=""					
			/>
		</span>
	);
}



/* --------------------------------------------------------------------------------------------------- */
const SaveCancelButtons = (props) => {
	const MODULE = 	"ManageAssetTypes.SaveCancelButtons";
	const LOGGER = new Logger().getLogger(MODULE);			
	const [isDataChanged, setIsDataChanged] = useState(false);

	useEffect(()=>{
		setIsDataChanged(props.isDataChanged);
		LOGGER.debug("FROM ", MODULE, "propsIsDataChangedHook: props.isDataChanged=", props.isDataChanged);
	},[props.isDataChanged, LOGGER]);

	useEffect(()=>{
		LOGGER.debug("FROM ", MODULE, "isDataChangedHook: isDataChanged=", isDataChanged);
	},[isDataChanged, LOGGER]);
	
	const onSaveHandler = (event) =>{		
		LOGGER.debug("FROM ", MODULE, "onSaveHandler: isDataChanged=", isDataChanged);
		props.onSave();
		event.stopPropagation();
	}
	
	const onCancelHandler = (event) =>{		
		LOGGER.debug("FROM ", MODULE, "onCancelHandler: isDataChanged=", isDataChanged);
		props.onCancel();
		event.stopPropagation();
	}


	return (
		<>
			{isDataChanged &&
				<span className={styles.saveCancelButtons}>				 
					<input type='button' id='saveButton' name= 'saveButton' onClick={onSaveHandler}/>
					<input type='button' id='cancelButton' name= 'cancelButton' onClick={onCancelHandler} />
				</span>
			}
		</>
	);
		
}