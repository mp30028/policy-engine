
export const fetchAll = async () => {
	const fetchUrl = "http://localhost:8083/policy-engine/api/attribute";
	console.log("fetch-url = ", fetchUrl);
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

export const fetchByIds = async (idList) => {
	const emptyResult = [];
	if (Array.isArray(idList)){
		if (idList.length > 0){
			const fetchUrl = "http://localhost:8083/policy-engine/api/attribute/" + idList.toString();
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
		}else{
			console.log("attributes/DataService.fetchByIds: returned empty array");
			return emptyResult;
		}			
	}else{
		console.log("attributes/DataService.fetchByIds: Expected idList to be an array but was not");
		return emptyResult;
	}
}