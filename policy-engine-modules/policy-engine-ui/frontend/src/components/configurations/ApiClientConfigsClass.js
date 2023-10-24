
export default class ApiClientConfigs{
	static baseUrl = "http://localhost:8083/policy-engine/api"
	static paths = {
		assetType: "/asset-type",
		attribute: "/attribute",
		policy: "/policy"
	}
	
	getUrl = (pathName) =>{
		return ApiClientConfigs.baseUrl + ApiClientConfigs.paths[pathName];
	}
}