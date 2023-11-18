class LogLevel {
	static INFO = "INFO";
	static DEBUG = "DEBUG";	 
}

export const LEVELS = {
	ManageAssetTypes:{ level: LogLevel.DEBUG,
		AccordionItemHeader:{level: LogLevel.INFO},
		SaveCancelButtons:{level: LogLevel.INFO},
		AccordionItemWrapper:{level: LogLevel.INFO},
		TextEdit:{level: LogLevel.INFO},
		Policies:{level: LogLevel.INFO,
			PickList: {level: LogLevel.INFO}
		}
	}	
}

export const FALLBACK_LOG_LEVEL = LogLevel.DEBUG;

