

export const fetchAll = async () => {
	const data = [{
			        "id": 1,
			        "asset_type": "user-file",
			        "description": "files uploaded by users"
			    }, {
			        "id": 2,
			        "asset_type": "worksheet-attachment",
			        "description": "a resource attached and displayed on a worksheet"
			    }, {
			        "id": 3,
			        "asset_type": "public-document",
			        "description": "a shared document available for all"
			    }, {
			        "id": 4,
			        "asset_type": "classroom-resource",
			        "description": "a resource used and shared within a classroom"
			    }, {
			        "id": 5,
			        "asset_type": "mentor-resource",
			        "description": "a private resource owned and used by a mentor"
			    }
			];
	return data;

}