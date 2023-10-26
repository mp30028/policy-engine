import React from 'react';
import "../../../static/css/Zonesoft.css"

export default class View {
	
	getView = (ENTITY_NAME, assetTypes, onAddNewClick, onSelectionChange, isChecked) => {	
		return (
			<table className="zsft-table" style={{ width: "100%" }}>
				<thead>
					<tr>
						<th></th>
						<th>ID</th>
						<th>Asset-Type</th>
						<th>Description</th>
						<th></th>					
					</tr>
				</thead>
				<tbody>
					{assetTypes.map(at =>
						<tr key={at.id}>
							<td>
								<input type="checkbox" name={ENTITY_NAME + "-selector-" + at.id} id={ENTITY_NAME + "-selector-" + at.id}  value={at.id} onChange={onSelectionChange} checked={isChecked(at.id)} />
							</td>
							<td>{at.id}</td>
							<td>{at.name}</td>
							<td>{at.description}</td>
							<td className="ellipses">...</td>
						</tr>
					)}
					<tr>
						<td colSpan={5}  style={{textAlign:"right"}}>
							<button type="button" onClick={onAddNewClick}>Add New</button>
						</td>
					</tr>
				</tbody>
			</table>
		);
	}
}