import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../css/Zonesoft.css"
import * as DataService from "./DataService";

function Policies() {

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
					<th>Attributes</th>
				</tr>
			</thead>
			<tbody>
				{policies.map(p =>
					<tr key={p.id}>
						<td>{p.id}</td>
						<td>{p.name}</td>
						<td>{p.description}</td>
						<td>
							{p.associatedAttributes.map(a =>
								<div key={a.id}>{a.name}</div> 
							)}
						</td>						
					</tr>
				)}
			</tbody>
		</table>
	);
}

export default Policies;