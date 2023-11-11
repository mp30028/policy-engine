import React, {useEffect, useState } from 'react';
import { Accordion, AccordionItem} from '@szhsin/react-accordion';
import ApiClientConfigs from "../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../classes/data-services/DataService.class";
import Logger from '../../classes/logger/Logger.class';
import Policies from './policies/Policies';
import styles from "./css/ManageAssetTypes.module.css";
import chevronDown from "../../static/icons/chevron-down.svg";
import EasyEdit from "react-easy-edit";

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
			
	return (
			<Accordion allowMultiple className={styles.accordion} style={{width: '800px'}}>
				{assetTypes.map(at =>
					<AccordionItem
						header={<AccordionItemHeader assetType={at} />}				
						headingProps={{ className: styles.header }}
						panelProps={{className: styles.panel}}
						buttonProps={{ className: ({ isEnter }) => `${styles.button} ${isEnter && styles.buttonExpanded}` }}
						contentProps={{className: styles.content}}
						className={styles.item}
						key={at.id}
					>
						<AccordionItemContent assetType={at} />						
					</AccordionItem>									
				)}				
			</Accordion>
	);
};
export default ManageAssetTypes;



/* --------------------------------------------------------------------------------------------------- */
const AccordionItemHeader = (props) => {
	const MODULE = 	"ManageAssetTypes.AccordionItemHeader";
	const LOGGER = new Logger().getLogger(MODULE);			

	const emptyAssetType = {id:0, name: "", description:"", associatedPolicies:[]}	
	const [assetType, setAssetType] = useState(emptyAssetType);
	
	useEffect(()=>{
		setAssetType(props.assetType);
	},[props.assetType])
		
	const onChangeHandler = (updatedAssetType) =>{		
		LOGGER.debug("FROM ", MODULE, ".onChangeHandler: updatedAssetType=", updatedAssetType);
	}
	
	return (
		<div>
			<div className={styles.headerContainer}>
				<span className={styles.label}>Asset-Type- 
					<span className={styles.id}>{assetType.id}</span>
				</span>								 
				<span className={styles.content}>						
					<TextEdit assetTypeProperty="name" assetType={assetType} onChange={onChangeHandler} />
				</span>
				<span className={styles.info}>
					<TextEdit assetTypeProperty="description" assetType={assetType} onChange={onChangeHandler} />
				</span>
				<img src={chevronDown} alt="Chevron Down" className={styles.chevron}/>									
			</div>
			<div  onClick={event => event.stopPropagation()}>
				<SaveCancelButtons assetType={assetType} />
			</div>
		</div>
	);
}



/* --------------------------------------------------------------------------------------------------- */
const AccordionItemContent = (props) =>{
	return (
		<>
			<Policies assetType={props.assetType} />
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
		let updatedAssetType = assetType;
		updatedAssetType[props.assetTypeProperty] = newValue;
		props.onChange(updatedAssetType);
		setAssetType(updatedAssetType);
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

	const emptyAssetType = {id:0, name: "", description:"", associatedPolicies:[]}	
	const [assetType, setAssetType] = useState(emptyAssetType);
	
	useEffect(()=>{
		setAssetType(props.assetType);
	},[props.assetType])

	return (
		<span >
			<input type='button' id='saveButton' name= 'saveButton' value='Save' />
			<input type='button' id='cancelButton' name= 'saveButton' value='Cancel' />
		</span>
	);
		
}