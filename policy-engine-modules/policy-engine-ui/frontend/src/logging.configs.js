class LogLevel {
	static INFO = "INFO";
	static DEBUG = "DEBUG";	 
}

export const LEVELS = {
	ManageAssetTypes:{ level: LogLevel.INFO,
		AccordionItemHeader:{level: LogLevel.INFO},
		SaveCancelButtons:{level: LogLevel.INFO},
		AccordionItemContent:{level: LogLevel.INFO},
		AccordionItemWrapper:{level: LogLevel.INFO},
		TextEdit:{level: LogLevel.INFO}
	}	
}

export const FALLBACK_LOG_LEVEL = LogLevel.INFO;

