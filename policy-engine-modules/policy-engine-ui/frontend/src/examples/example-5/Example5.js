import React, { useState, useEffect } from 'react';

const Example5 = () => {
	const MODULE = 	"Example-5";
	const [envVars, setEnvVars] = useState("");	
	
	useEffect(() => {		
		const fetchEnvVars = async() => {
//			const fetchUrl = "http://localhost:1111/policy-engine/env-vars";			                  
			const fetchUrl = "/policy-engine/env-vars";
			const response = await fetch(
				fetchUrl, 
				{	method: 'GET',
					headers: {
						'Content-Type': 'application/json;charset=UTF-8',
						'Accept': 'application/json, text/plain'
					}
				}
			);
			const returnedJson = await response.json();
			console.log("returnedJson=", returnedJson)
			return returnedJson;
		}
		
		fetchEnvVars().then((data) => setEnvVars(data));		
	}, [setEnvVars]);	
	
	return (
		<div>
			Hi there. These details are from {MODULE}<br/><br/><br/>

			<h3>Environment-Variables: </h3>
			REACT_APP_ENV_API_PROTOCOL: {envVars.REACT_APP_ENV_API_PROTOCOL} <br/>
			REACT_APP_ENV_API_HOST: {envVars.REACT_APP_ENV_API_HOST}<br/>
			REACT_APP_ENV_API_PORT: {envVars.REACT_APP_ENV_API_PORT}<br/>
			REACT_APP_ENV_API_PORT: {envVars.REACT_APP_ENV_API_CONTEXT_PATH}<br/>
			REACT_APP_CURRENT_USER_PROVIDER_ID: {envVars.REACT_APP_CURRENT_USER_PROVIDER_ID}<br/>
			REACT_APP_CURRENT_USERNAME: {envVars.REACT_APP_CURRENT_USERNAME}<br/>
			REACT_APP_CURRENT_USER_ROLES: {envVars.REACT_APP_CURRENT_USER_ROLES}<br/>
		</div>
	);
};

export default Example5;


