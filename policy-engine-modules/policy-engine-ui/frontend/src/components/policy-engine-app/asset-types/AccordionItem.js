import React, { useState } from 'react';
import { AccordionItem as Item } from '@szhsin/react-accordion';
import chevronDown from "../../../static/icons/chevron-down.svg";
import "../../../static/css/InlineEdit.css"
import styles from "./accordion.module.css";
import EasyEdit from "react-easy-edit";
export default function AccordionItem({ assetType, label, ...rest }) {
	//const httpTaskCallback = () => {};

	console.log("FROM AccordionItem: assetType=", assetType);
	//	const [editValue, setEditValue] = useState('');
	//	
	//	setEditValue((header) ? header : '');
	//	
	const save = (newValue) => {
		console.log("FROM AccordionItem.save", "key=", newValue.key, "value", newValue.value);
	}
	const cancel = () => {
		console.log("FROM AccordionItem.cancel");
	}

	const NameEdit = () => {
		return (
			<EasyEdit
				type="text"
				value={assetType.name}
				onSave={(newValue) => save({ key: 'name', value: newValue })}
				onCancel={cancel}
				saveButtonLabel=""
				cancelButtonLabel=""
				attributes={{ name: "name-edit", id: assetType.id }}
			/>
		)
	}

	const DescriptionEdit = () => {
		return (
			<p className={styles.description}>
				<EasyEdit
					type="text"
					value={assetType.description}
					onSave={(newValue) => save({ key: 'description', value: newValue })}
					onCancel={cancel}
					saveButtonLabel=""
					cancelButtonLabel=""
					attributes={{ name: "description-edit", id: assetType.id }}
				/>
			</p>
		)		
	}

	return (
		<>
			<Item
				{...rest}
				header={
					<>
						<span className={styles.label}>{label + '-' + assetType.id}: </span>
						<NameEdit />						
						<DescriptionEdit />						
						<img className={styles.chevron} src={chevronDown} alt="Chevron Down" />
					</>
				}
				className={styles.item}
				buttonProps={{ className: ({ isEnter }) => `${styles.itemBtn} ${isEnter && styles.itemBtnExpanded}` }}
				contentProps={{ className: styles.itemContent }}
				panelProps={{ className: styles.itemPanel }}
			/>
		</>
	);
}