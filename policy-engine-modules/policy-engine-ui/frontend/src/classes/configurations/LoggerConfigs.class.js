export default class LoggerConfigs{
	
	static FALLBACK_LOG_LEVEL = "INFO";		

	static LEVELS = {
		ManageAssetTypes: { level: "INFO", 
							AccordionItemHeader:{level:"INFO"},
							SaveCancelButtons:{level:"INFO"},
							AccordionItemContent:{level:"INFO"},
							AccordionItemWrapper:{level:"DEBUG"},
							TextEdit:{level:"INFO"}
		}		
	}
	
	getLogLevel = (loggerName) => {
		const names = loggerName.split(".");
		var currentNode = LoggerConfigs.LEVELS;
		for (let n in names){
			const name = names[n];			
			const nextNode = currentNode[name];
			if(nextNode){
				currentNode = nextNode;				 
			}else{
				currentNode = null;
				break;
			}
		}
		return ((currentNode) ? currentNode.level : LoggerConfigs.FALLBACK_LOG_LEVEL);		
	}
	
}