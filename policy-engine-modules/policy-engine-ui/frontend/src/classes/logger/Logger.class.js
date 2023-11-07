import {default as LOG} from 'loglevel';
import LoggerConfigs from '../configurations/LoggerConfigs.class';

export default class Logger{
		
	constructor() {
		this.configs = new LoggerConfigs();
		this.FALLBACK_LOG_LEVEL = "INFO";
//		this.FALLBACK_LOG_LEVEL = "UNKNOWN";
		
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
				logger.setLevel(this.FALLBACK_LOG_LEVEL);
			}
		}					
		return logger;
	}
	
}