import React from 'react';
import Logger from '../../classes/logger/Logger.class';
import EasyEdit from "react-easy-edit";
import styles from "./accordion.module.css";
import "../../static/css/InlineEdit.css"

const DescriptionEdit = (props) => {
	const LOGGER = new Logger().getLogger("AT_AI_DescriptionEdit");		
	const save = (newValue) => {
		props.onChange(newValue);
	}
	
	const cancel = () => {
		LOGGER.debug("FROM AccordionItem.DescriptionEdit.cancel");
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

export default DescriptionEdit;