import React from 'react';
import "../css/Zonesoft.css"
import AssetTypes from "../asset-types/AssetTypes";
import Policies from "../policies/Policies";
import Attributes from "../attributes/Attributes";


function PolicyEngineApp() {
	
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
					<td colSpan={2}><AssetTypes /></td>					
				</tr>
				<tr>
					<td><Policies /></td>
					<td><Attributes /></td>
				</tr>
			</tbody>
		</table>
	);
}

export default PolicyEngineApp;