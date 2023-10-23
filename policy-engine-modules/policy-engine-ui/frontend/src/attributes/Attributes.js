import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../css/Zonesoft.css"
import * as DataService from "./DataService";

function Attributes() {

	const [attributes, setAttributes] = useState([]);

	useEffect(() => {
		DataService.fetchAll().then((data) => setAttributes(data));
	}, [setAttributes]);
	
	return (
		<table className="zsft-table" style={{ width: "100%" }}>
			<thead>
				<tr>
					<th>ID</th>
					<th>Attribute</th>
					<th>Description</th>
					<th>Manage</th>					
				</tr>
			</thead>
			<tbody>
				{attributes.map(at =>
					<tr key={at.id}>
						<td>{at.id}</td>
						<td>{at.name}</td>
						<td>{at.description}</td>
						<td className="ellipses">...</td>
					</tr>
				)}
			</tbody>
		</table>
	);
}

export default Attributes;