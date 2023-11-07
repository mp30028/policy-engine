export default class LoggerConfigs{
	
	static FALLBACK_LOG_LEVEL = "INFO";		

	static LEVELS = {
		AssetTypes: "DEBUG",
//		AT_AccordionItem: "INFO",
		AT_CommitChangesButton: "DEBUG",
		AT_AI_DescriptionEdit : "DEBUG",		
		AT_AI_NameEdit : "DEBUG",
//		AT_Policies: "INFO",
		AT_Policies_PickList: "INFO"
	}
	
	getLogLevel = (name) => {
		let lookupValue = LoggerConfigs.LEVELS[name];
		return (lookupValue) ? lookupValue : LoggerConfigs.FALLBACK_LOG_LEVEL;
	}
	
}