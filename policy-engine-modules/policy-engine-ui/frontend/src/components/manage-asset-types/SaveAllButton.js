import React from 'react';
import Logger from '../../classes/logger/Logger.class';

const SaveAllButton = (props) =>{
	const LOGGER = new Logger().getLogger("AT_SaveAllButton");		
	const saveAllOnClick = (event) =>{
		LOGGER.debug("FROM AssetTypes.saveAllOnClick, event=", event);
		props.onSave();
	}
		
	return (
		<input type='button' name='saveAll' id='saveAll' onClick={saveAllOnClick} value='Commit Changes'/>
	); 	
}

export default SaveAllButton;