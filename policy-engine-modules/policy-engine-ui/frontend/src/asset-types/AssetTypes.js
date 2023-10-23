import React, { useState, useEffect, /*useRef*/ } from 'react';
import "../css/Zonesoft.css"
import * as DataService from "./DataService";

function AssetTypes(props) {
	const ENTITY_NAME = "asset-type";
	const [assetTypes, setAssetTypes] = useState([]);	
	const [listOfSelected, setListOfSelected]= useState([]);	
	
	useEffect(() => {
		DataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
	
	const onAddNewClick = () =>{
		//const {name, value} = event.target;
		//props.onSubmit({event, name, value});
	}
	
	const onSelectionChange = (event) =>{
		multiSelectHandler(event, assetTypes, listOfSelected, setListOfSelected);				
	}
		
	const isChecked = (id) =>{		
		const getTargetDataItem = () => {
			return assetTypes.find(x => x.id === id);	
		};		
		return isInListOfSelected(listOfSelected, getTargetDataItem());
	}
	
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
					<td colSpan={4}  style={{textAlign:"right"}}>
						<button type="button" onClick={onAddNewClick}>Add New</button>
					</td>
				</tr>
			</tbody>
		</table>
	);
}

	const isInListOfSelected = (listOfSelected, targetDataItem) =>{
		const selector = ((item) => item.id === targetDataItem.id);
		const foundItem = listOfSelected.find(selector);
		return foundItem ? true : false;
	};

	const multiSelectHandler = (event, data, listOfSelected, setListOfSelected) =>{								
		const getTargetDataItem = () => {
			return data.find(x => x.id === parseInt(event.target.value));	
		};
								
		const updateListOfSelected = () =>{
			const addToListOfSelected = () =>{
				const newListOfSelected =  [...listOfSelected, targetDataItem];
				setListOfSelected(newListOfSelected);
			};
	
			const removeFromListOfSelected = () =>{
				const selector = ((item) => item.id !== targetDataItem.id);			
				const newListOfSelected = listOfSelected.filter(selector);
				setListOfSelected(newListOfSelected);			
			};
						
			if (event.target.checked){
				if (!isInListOfSelected(listOfSelected, targetDataItem)){
					addToListOfSelected();
				}//else do nothing as already in the list
			}else{
				if (isInListOfSelected(listOfSelected, targetDataItem)){
					removeFromListOfSelected();
				}//else do nothing as already not there
			}
		};		

		const targetDataItem = getTargetDataItem();
		updateListOfSelected();		
	}
		

export default AssetTypes;