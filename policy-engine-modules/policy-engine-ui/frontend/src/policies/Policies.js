import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../css/Zonesoft.css"
import * as DataService from "./DataService";

function PolicyEngineApp() {

	const [policies, setPolicies] = useState([]);

	useEffect(() => {
		DataService.fetchAll().then((data) => setPolicies(data));
	}, [setPolicies]);
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th>ID</th>
					<th>Policy</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				{policies.map(p =>
					<tr>
						<td>{p.id}</td>
						<td>{p.policy}</td>
						<td>{p.description}</td>
					</tr>
				)}
			</tbody>
		</table>
	);
}

export default PolicyEngineApp;