import {default as LOG} from 'loglevel';
import {LEVELS, FALLBACK_LOG_LEVEL} from "../../logging.configs";

class LoggerConfigs{
	
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
		return ((currentNode) ? currentNode.level : FALLBACK_LOG_LEVEL);		
	}
	
}


export default class Logger{
		
	constructor() {
		this.configs = new LoggerConfigs();
	}

	getLogger = (name, defaultLevel) => {
		var logger = LOG.getLogger(name);
		if (defaultLevel){
			logger.setLevel(defaultLevel);	
		}else{
			const configuredLogLevel = this.configs.getLogLevel(name);
			if(configuredLogLevel){
				logger.setLevel(configuredLogLevel);
			}else{
				logger.setLevel(FALLBACK_LOG_LEVEL);
			}
		}					
		return logger;
	}
	
}