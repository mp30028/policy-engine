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
					'Content-Type': 'application/json;charset=U-8',
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
}