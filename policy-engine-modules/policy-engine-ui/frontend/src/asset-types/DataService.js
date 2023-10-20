
export const fetchAll = async () => {
	const fetchUrl = "http://localhost:8083/policy-engine/api/asset-type";
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