import React from 'react';
import "../css/Zonesoft.css"
import Policies from "../policies/Policies";


function PolicyEngineApp() {
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th >
						Policy Management App
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td  style={{ width: "100%" }}><Policies /></td>
				</tr>
			</tbody>
		</table>
	);
}

export default PolicyEngineApp;