export default class DataService{
	
	constructor(configs, pathName) {
		this.configs = configs;
		this.pathName = pathName;
	}
	
	#fetch = async(fetchUrl) => {
		const response = await fetch(
			fetchUrl, 
			{	method: 'GET',
				headers: {
					'Content-Type': 'application/json;charset=UTF-8',
					'Accept': 'application/json, text/plain'
				}
			}
		);
		return await response.json();
	}		
	
	fetchAll = async () => {
		return await this.#fetch(this.configs.getUrl(this.pathName));
	}

	fetchByIds = async (idList) => {
		const emptyResult = [];
		if (Array.isArray(idList)){
			if (idList.length > 0){
				const fetchUrl = this.configs.getUrl(this.pathName) + "/" + idList.toString();
				return await this.#fetch(fetchUrl);
			}else{
				return emptyResult;
			}			
		}else{
			return emptyResult;
		}
	}
	
	update = async (data) => {
		const fetchUrl = this.configs.getUrl(this.pathName) + "/" + data.id;
		console.log("FROM DataService.update: data=", JSON.stringify(data), "id=", data.id);
		const response = await fetch(
			fetchUrl,
			{
				method: 'PUT',
				body: JSON.stringify(data),
				headers: {
					'Content-Type': 'application/json;charset=UTF-8',
					'Accept': 'application/json, text/plain'
				}
			}
		);
		const responseJson = await response.json();
		console.log("FROM DataService.update: responseJson=", responseJson);
		return responseJson;
	}
}