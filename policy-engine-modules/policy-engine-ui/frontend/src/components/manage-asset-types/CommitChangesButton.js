import React from 'react';
import Logger from '../../classes/logger/Logger.class';

const CommitChangesButton = (props) =>{
	const LOGGER = new Logger().getLogger("AT_SaveAllButton");
	
	const onClickHandler = (event) =>{
		LOGGER.debug("FROM SaveAllButton.onClickHandler, event=", event);
		props.onSave();
	}
		
	return (
		<input type='button' name='saveAll' id='saveAll' onClick={onClickHandler} value='Commit Changes'/>
	); 	
}

export default CommitChangesButton;