export default class LoggerConfigs{
	
	static FALLBACK_LOG_LEVEL = "INFO";		

	static LEVELS = {
		ManageAssetTypes: { level: "INFO", 
							AccordionItemHeader:{level:"DEBUG"},
							SaveCancelButtons:{level:"DEBUG"},
							AccordionItemContent:{level:"INFO"},
							AccordionItemWrapper:{level:"INFO"},
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