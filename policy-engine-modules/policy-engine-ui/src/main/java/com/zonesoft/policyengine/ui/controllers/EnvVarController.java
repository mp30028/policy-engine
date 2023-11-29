package com.zonesoft.policyengine.ui.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EnvVarController {
	@Value(value = "${com.zonesoft.policy-engine.api.protocol:http}")
	private String apiProtocol;	
	
	@Value(value = "${com.zonesoft.policy-engine.api.host:localhost}")
	private String apiHost;	

	@Value(value = "${com.zonesoft.policy-engine.api.port:8083}")
	private String apiPort;	

	@Value(value = "${com.zonesoft.policy-engine.api.context-path:/policy-engine/api}")
	private String apiContextPath;	

//	@RequestMapping (value = "/**{path:[^\\.]*} ")
//	public String forward() {
//		return "forward:/ "; 
//	}
	
	@GetMapping(value={"/policy-engine/env-vars"})
	@ResponseBody
	public EnvVar envVars() {
		EnvVar envVar = new EnvVar();
		envVar.REACT_APP_ENV_API_PROTOCOL = this.apiProtocol;
		envVar.REACT_APP_ENV_API_HOST = this.apiHost;
		envVar.REACT_APP_ENV_API_PORT = Integer.parseInt(apiPort);
		envVar.REACT_APP_ENV_API_CONTEXT_PATH = this.apiContextPath;
		return envVar;
	}
	
	class EnvVar{
		public String REACT_APP_ENV_API_PROTOCOL;
		public String REACT_APP_ENV_API_HOST;
		public int REACT_APP_ENV_API_PORT;
		public String REACT_APP_ENV_API_CONTEXT_PATH;
	}

}
