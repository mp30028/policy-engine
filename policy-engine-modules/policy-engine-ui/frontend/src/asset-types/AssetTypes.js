import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../css/Zonesoft.css"
import * as DataService from "./DataService";

function AssetTypes() {

	const [assetTypes, setAssetTypes] = useState([]);

	useEffect(() => {
		DataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th>ID</th>
					<th>Asset-Type</th>
					<th>Description</th>
					<th>Associated-Policies</th>
				</tr>
			</thead>
			<tbody>
				{assetTypes.map(at =>
					<tr>
						<td>{at.id}</td>
						<td>{at.name}</td>
						<td>{at.description}</td>
						<td>
							{at.associatedPolicies.map(p =>
								p.name + "         [id=" + p.id + "]" 
							)}
						</td>
					</tr>
				)}
			</tbody>
		</table>
	);
}

export default AssetTypes;