import LEVELS from "../../logging.configs";

export default class LoggerConfigs{
	
	static FALLBACK_LOG_LEVEL = "INFO";
	
	getLogLevel = (loggerName) => {
		const names = loggerName.split(".");
		var currentNode = LEVELS;
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