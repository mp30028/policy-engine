import React from 'react';
import "../../../static/css/Zonesoft.css"

export default class View {
		
	getView = (ENTITY_NAME, policies, onAddNewClick, onSelectionChange, isChecked) => {	
		return (
			<table className="zsft-table" style={{ width: "100%" }}>
				<thead>
					<tr>
						<th></th>
						<th>ID</th>
						<th>Policy</th>
						<th>Description</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					{policies.map(p =>
						<tr key={p.id}>
							<td>
								<input type="checkbox" name={ENTITY_NAME + "-selector-" + p.id} id={ENTITY_NAME + "-selector-" + p.id}  value={p.id} onChange={onSelectionChange} checked={isChecked(p.id)} />
							</td>					
							<td>{p.id}</td>
							<td>{p.name}</td>
							<td>{p.description}</td>
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
		)
	};	
}