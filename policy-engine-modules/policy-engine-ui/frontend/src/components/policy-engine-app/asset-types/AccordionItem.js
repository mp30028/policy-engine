import React, { useEffect, useState } from 'react';
import { AccordionItem as Item } from '@szhsin/react-accordion';
import chevronDown from "../../../static/icons/chevron-down.svg";
import "../../../static/css/InlineEdit.css"
import styles from "./accordion.module.css";
import EasyEdit from "react-easy-edit";

const AccordionItem = ({ assetTypeIn, onDataChange, label, ...rest }) => {
//const AccordionItem = (props) => {	
	console.log("FROM AccordionItem: assetTypeIn=", assetTypeIn);
	
	const [assetType, setAssetType] = useState(null);
	
	useEffect(() => {
		setAssetType(assetTypeIn);
	}, [assetTypeIn, setAssetType])	
	
//	useEffect(() => {
//		setAssetType(props.assetType);
//	}, [props.assetType, setAssetType])

	useEffect(() => {
		console.log("FROM AccordionItem:useEffect[assetType]: assetType=", (assetType)?assetType.toString():'null');
	}, [assetType])

	
	const dataUpdateHandler = (newValue) => {
		console.log("FROM AccordionItem.dataUpdateHandler", "key=", newValue.key, ", value=", newValue.value);
		var updated = assetType;
		updated[newValue.key]= newValue.value;
		console.log("FROM AccordionItem.dataUpdateHandler", "updated=", updated);
		setAssetType(updated);
//		if (props.onDataChange)  props.onDataChange({type: 'UPDATE', data: updated});
		if (onDataChange)  onDataChange({type: 'UPDATE', data: updated});
	};
	
	return (
		<>
			<Item
				{/*...props.rest*/
				...rest}
				header={
					(assetType) ?
						<>
{/*							<span className={styles.label}>{props.label + '-' + assetType.id}: </span>*/}
							<span className={styles.label}>{label + '-' + assetType.id}: </span>
							<NameEdit assetType={assetType} onChange={dataUpdateHandler} />						
							<DescriptionEdit assetType={assetType} onChange={dataUpdateHandler}/>						
							<img className={styles.chevron} src={chevronDown} alt="Chevron Down" />
						</>
						:
						<>{/* ELSE empty */}</>
				}
				className={styles.item}
				buttonProps={{ className: ({ isEnter }) => `${styles.itemBtn} ${isEnter && styles.itemBtnExpanded}` }}
				contentProps={{ className: styles.itemContent }}
				panelProps={{ className: styles.itemPanel }}
			/>
		</>
	);
}


const NameEdit = (props) => {	
	const save = (newValue) => {
//		console.log("FROM AccordionItem.save", "key=", newValue.key, "value", newValue.value);
		props.onChange(newValue);
	};
		
	const cancel = () => {
		console.log("FROM AccordionItem.cancel");
	};		
		
	return (
		<span>
			<EasyEdit
				type="text"
				value={props.assetType.name}
				onSave={(newValue) => save({ key: 'name', value: newValue })}
				onCancel={cancel}
					saveButtonLabel=""
					cancelButtonLabel=""			
				attributes={{ name: "name-edit", id: props.assetType.id }}
			/>
		</span>
	);
}


const DescriptionEdit = (props) => {
	const save = (newValue) => {
//		console.log("FROM AccordionItem.save", "key=", newValue.key, "value", newValue.value);
		props.onChange(newValue);
	}
	
	const cancel = () => {
		console.log("FROM AccordionItem.cancel");
	}		
	return (
		<span className={styles.description}>
			<EasyEdit
				type="text"
				value={props.assetType.description}
				onSave={(newValue) => save({ key: 'description', value: newValue })}
				onCancel={cancel}
				saveButtonLabel=""
				cancelButtonLabel=""
				attributes={{ name: "description-edit", id: props.assetType.id }}
			/>
		</span>
	)		
}


	
export default AccordionItem;