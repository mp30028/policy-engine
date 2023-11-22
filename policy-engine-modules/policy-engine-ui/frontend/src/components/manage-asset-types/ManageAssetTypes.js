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
		
	const dataUpdateHandler = (updatedAssetType) => {

		const removeAssetType = (assetTypeToRemove) => {
			const updatedAssetTypes = assetTypes.filter(at => at.id !== assetTypeToRemove.id );
			setAssetTypes(updatedAssetTypes);			
		}
		
		const replaceAssetType = (idOfAssetTypeToReplace, replacementAssetType) => {
			const updatedAssetTypes = assetTypes.map(at => (at.id === idOfAssetTypeToReplace) ? replacementAssetType : at);
			setAssetTypes(updatedAssetTypes);
		}


		
		if (updatedAssetType.isCancelled){			
			removeAssetType(updatedAssetType);
		}else{			
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			if (updatedAssetType.isMarkedForDeletion){
				dataService.deleteById(updatedAssetType.id).then( (data) => LOGGER.debug("FROM AssetTypes.dataUpdateHandler, updated-data=", data));
				updatedAssetType.isMarkedForDeletion = null;
				removeAssetType(updatedAssetType);
			}else{
				if (updatedAssetType.id > 0){
					dataService.update(updatedAssetType).then( (data) => LOGGER.debug("FROM AssetTypes.dataUpdateHandler, updated-data=", data));
				}else{
					const tempId = updatedAssetType.id; 
					updatedAssetType.id = null;
					dataService.addNew(updatedAssetType).then( (data) =>{					 						 	
					 	LOGGER.debug("FROM AssetTypes.dataUpdateHandler, newly-added-data=", data, "tempId=", tempId);
					 	updatedAssetType.id = data.id;
						replaceAssetType(tempId, updatedAssetType);
					});
//					const updatedAssetTypes = [...assetTypes, updatedAssetType];
//					setAssetTypes(updatedAssetTypes);													
				}
			}
		}		
	};
	
	return (

			<Accordion allowMultiple className={styles.accordion} style={{width: '1000px'}}>
				<AddNew assetTypesState={[assetTypes, setAssetTypes]} />

				{assetTypes.map(at =>
					<AccordionItemWrapper assetType={at}  onDataUpdate={dataUpdateHandler} key={at.id}/>				
				)}
			</Accordion>

	);
};
export default ManageAssetTypes;



/* --------------------------------------------------------------------------------------------------- */
	const AddNew = (props) => {
		const MODULE = 	"ManageAssetTypes.AddNew";
		const LOGGER = new Logger().getLogger(MODULE);				
		
		const protoAssetType = {
			id:-1, 
			name: "click-here to update name", 
			description:"click-here and provide a description of the asset-type", 
			associatedPolicies:[]
		}
		const [assetTypes, setAssetTypes] = props.assetTypesState;					
		
		const onClickHandler = () => {			
			const id = ((new Date()).getTime() * -1);
			const newAssetType = cloneDeep(protoAssetType);
			newAssetType.id = id;
			LOGGER.debug("FROM ", MODULE, ".onClickHandler", "newAssetType=", newAssetType);
			const updatedAssetTypes = [...assetTypes, newAssetType];
			setAssetTypes(updatedAssetTypes);
		}
	
		return (
			<span className={styles.buttonPanel}>
				<span
					onClick={onClickHandler}
					className={styles.addNewIcon}
					title={'Add and configure a new Asset-Type'}
				/>
			</span>
		);
	}


/* --------------------------------------------------------------------------------------------------- */
	const AccordionItemWrapper = (props) => {
		const MODULE = 	"ManageAssetTypes.AccordionItemWrapper";
		const LOGGER = new Logger().getLogger(MODULE);
		const emptyAssetType = {id:0, name: "", description:"", associatedPolicies:[]}
		const [currentAssetType, setCurrentAssetType] = useState(emptyAssetType);
		const [editedAssetType, setEditedAssetType] = useState(cloneDeep(props.assetType));
		const [isDataChanged, setIsDataChanged] = useState(false);
		
		useEffect(()=>{
			LOGGER.debug("FROM ", MODULE, "props.assetType (Hook): props.assetType=", props.assetType);
			setCurrentAssetType(cloneDeep(props.assetType));
		},[props.assetType, LOGGER])
		
		useEffect(()=>{
			if(currentAssetType.id < 0){
				setIsDataChanged(true);
			}else if(editedAssetType.isMarkedForDeletion){
				setIsDataChanged(true);
				LOGGER.debug("FROM ", MODULE, ".isDataChanged (Hook): currentAssetType=", currentAssetType, "editedAssetType", editedAssetType);
			}else{
				const isDifferent = (!isEqual(editedAssetType, currentAssetType));			
				setIsDataChanged(isDifferent);
				LOGGER.debug("FROM ", MODULE, ".isDataChanged (Hook): currentAssetType=", currentAssetType, "editedAssetType", editedAssetType, "isDifferent=" ,isDifferent);
			}						
		},[currentAssetType, editedAssetType, LOGGER])
		
		const dataStates = [
			currentAssetType, setCurrentAssetType, 
			editedAssetType, setEditedAssetType, 
			isDataChanged
		];
		
		
		return (
				<AccordionItem
					header={<AccordionItemHeader dataStates={dataStates} onDataUpdate={props.onDataUpdate} />}
					headingProps={{ className: styles.header }}
					panelProps={{className: styles.panel}}
					buttonProps={{ className: ({ isEnter }) => `${styles.button} ${isEnter && styles.buttonExpanded}` }}
					contentProps={{className: styles.content}}
					className={styles.item}
					key={props.assetType.id}
				>
					<Policies dataStates={[editedAssetType, setEditedAssetType]}/>
				</AccordionItem>
		);	
	}



/* --------------------------------------------------------------------------------------------------- */
	const AccordionItemHeader = (props) => {
		const MODULE = 	"ManageAssetTypes.AccordionItem";
		const LOGGER = new Logger().getLogger(MODULE);			
		const [
				currentAssetType, setCurrentAssetType, 
				editedAssetType, setEditedAssetType, 
				isDataChanged
		] = props.dataStates;
		
		const onSaveHandler = () =>{
			LOGGER.debug("FROM ", MODULE, ".onSaveHandler: currentAssetType=", currentAssetType, ". editedAssetType=", editedAssetType);
			props.onDataUpdate(editedAssetType);
			setCurrentAssetType(editedAssetType);			
		}
		
		const onCancelHandler =() =>{
			LOGGER.debug("FROM ", MODULE, ".onCancelHandler: currentAssetType=", currentAssetType, ". editedAssetType=", editedAssetType);
			if (editedAssetType.id < 0){
				editedAssetType.isCancelled=true;
				props.onDataUpdate(editedAssetType);
			}else{
				setEditedAssetType(currentAssetType);
			}
		}
		
		return (			
			<span className={styles.headerContainer} key={currentAssetType.id}>
				<Delete assetTypeState={[editedAssetType, setEditedAssetType]} />

				<span className={styles.label}>Asset-Type- 
					<span className={styles.id}>
						{
							(currentAssetType.id >= 0) ? 
								currentAssetType.id : 
								'<new>'
						}
					</span>
				</span>								 

				<span className={styles.content}>				
					<TextEdit assetTypeProperty="name" assetTypeState={[editedAssetType, setEditedAssetType]} />					
				</span>

				<span className={styles.info}>
					<TextEdit assetTypeProperty="description" assetTypeState={[editedAssetType, setEditedAssetType]} />
				</span>			
				<span className={styles.buttons}>
					<SaveCancelButtons isDataChanged={isDataChanged} onSave={onSaveHandler} onCancel={onCancelHandler} />
					<img src={chevronDown} alt="Chevron Down" className={styles.chevron}/>
				</span>

			</span>
		);
		
	}



/* --------------------------------------------------------------------------------------------------- */
	const Delete = (props) => {
		const MODULE = 	"ManageAssetTypes.delete";
		const LOGGER = new Logger().getLogger(MODULE);	
		const [assetType, setAssetType] = props.assetTypeState;
		
		const onClickHandler = (event) => {
			LOGGER.debug("FROM ", MODULE, ": ");
			const updatedAssetType =  cloneDeep(assetType);
			updatedAssetType.isMarkedForDeletion = true;
			setAssetType(updatedAssetType);
			event.stopPropagation();
		}
		
		return(
			<>
				{(assetType.id > 0) ?
					(assetType.isMarkedForDeletion) ?
						<span className={styles.markedForDeletionIcon} title={"WARNING:" + assetType.name + ' has been marked for permanent deletion'} onClick={event => event.stopPropagation()} />
					:
						<span className={styles.deleteIcon} title={'Click to mark ' + assetType.name + ' for deletion'} onClick={onClickHandler} />
				:
					<span className={styles.newRecordIcon} onClick={event => event.stopPropagation()}/>
				}
			</>			
		);
	}

/* --------------------------------------------------------------------------------------------------- */
	const TextEdit = (props) => {
		const MODULE = 	"ManageAssetTypes.TextEdit";
		const LOGGER = new Logger().getLogger(MODULE);
		const [assetType, setAssetType] = props.assetTypeState;		
		
		LOGGER.debug("FROM ", MODULE, ": props.assetTypeProperty=", props.assetTypeProperty, "props.assetTypeState=", props.assetTypeState);
				
		const saveEdits = (newValue) => {		
			LOGGER.debug("FROM ", MODULE, ".saveEdits: newValue=", newValue);
			const updatedAssetType = cloneDeep(assetType); 
			updatedAssetType[props.assetTypeProperty] = newValue;
			setAssetType(updatedAssetType);
		};
	
		const cancelEdits = () => {
			LOGGER.debug("FROM ", MODULE, ".cancel");		
		};		
			
		return (
			<span onClick={event => event.stopPropagation()}>
				<EasyEdit
					type="text"
					value={assetType[props.assetTypeProperty]}
					onSave={(newValue) => saveEdits(newValue)}
					onCancel={cancelEdits}
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