import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../../../static/css/Zonesoft.css"
import * as DataService from "./DataService";

function Attributes(props) {

	const [attributes, setAttributes] = useState([]);
	const [selectedPolicy, setSelectedPolicy] = useState([]);

	useEffect(() => {
		console.log("FROM Attributes-useEffect[selectedPolicy]: selectedPolicy =", selectedPolicy)
		DataService.fetchAll().then((data) => setAttributes(data));
	}, [selectedPolicy]);
	
	useEffect(() => {
		setSelectedPolicy(props.selectedPolicy);
	}, [props.selectedPolicy]);	
	
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