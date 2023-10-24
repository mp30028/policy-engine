import React from 'react';
import "../../../static/css/Zonesoft.css"

export default class View {
	
	getView = (attributes) => {	
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
}