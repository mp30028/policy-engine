import React from 'react';
import "../css/Zonesoft.css"
import AssetTypes from "../asset-types/AssetTypes";
import Policies from "../policies/Policies";


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
					<td  style={{ width: "30%" }}><AssetTypes /></td>
					<td  style={{ width: "70%" }}><Policies /></td>
				</tr>
			</tbody>
		</table>
	);
}

export default PolicyEngineApp;