import React, {useState} from 'react';
import "../css/Zonesoft.css"
import AssetTypes from "../asset-types/AssetTypes";
import Policies from "../policies/Policies";
import Attributes from "../attributes/Attributes";


function PolicyEngineApp() {
	
	const [selectedAssetTypes, setSelectedAssetTypes] = useState([]);
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th colSpan="2">
						Policy Management App
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colSpan={2}><AssetTypes selectedAssetTypesSetter={setSelectedAssetTypes} /></td>
				</tr>
				<tr>
					<td><Policies selectedAssetTypes={selectedAssetTypes} /></td>
					<td><Attributes  /></td>
				</tr>
			</tbody>
		</table>
	);
}

export default PolicyEngineApp;