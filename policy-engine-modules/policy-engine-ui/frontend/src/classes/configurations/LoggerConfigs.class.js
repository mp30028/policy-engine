export default class LoggerConfigs{
	
	static FALLBACK_LOG_LEVEL = "INFO";		

	static LEVELS = {
		ManageAssetTypes: "INFO",
	}
	
	getLogLevel = (name) => {
		let lookupValue = LoggerConfigs.LEVELS[name];
		return (lookupValue) ? lookupValue : LoggerConfigs.FALLBACK_LOG_LEVEL;
	}
	
}