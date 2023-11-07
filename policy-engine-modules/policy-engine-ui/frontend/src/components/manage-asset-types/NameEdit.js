import React from 'react';
import Logger from '../../classes/logger/Logger.class';
import EasyEdit from "react-easy-edit";

const NameEdit = (props) => {
	const LOGGER = new Logger().getLogger("AT_AI_NameEdit");
	const save = (newValue) => {
		props.onChange(newValue);
	};
		
	const cancel = () => {
		LOGGER.debug("FROM AccordionItem.NameEdit.cancel");
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

export default NameEdit;