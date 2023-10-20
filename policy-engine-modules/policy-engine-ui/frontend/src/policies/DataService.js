

export const fetchAll = async () => {
	const data =[
					{
						"id" : 1,
						"policy" : "default",
						"description" : "default policy that applies to all asset types"
					},
					{
						"id" : 2,
						"policy" : "subscription",
						"description" : "subscription policy to be applied to resources"
					},
					{
						"id" : 3,
						"policy" : "ownership",
						"description" : "ownership of resources"
					}
				];
	
	return data;

}