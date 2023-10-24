import { useState, useEffect } from 'react';
import "../../../static/css/Zonesoft.css"
import DataService from "../../data-services/DataServiceClass";
import ApiClientConfigs from "../../configurations/ApiClientConfigsClass";
import View from './View';

function AssetTypes(props) {
	const ENTITY_NAME = "assetType";
	const view = new View();
	const [assetTypes, setAssetTypes] = useState([]);	
	const [listOfSelected, setListOfSelected]= useState([]);	
	
	useEffect(() => {
		const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
		dataService.fetchAll().then((data) => setAssetTypes(data));
	}, [setAssetTypes]);
	
	useEffect(() => {
		props.selectedAssetTypesSetter(listOfSelected);
	}, [props, listOfSelected]);
	
	const onAddNewClick = () =>{
		//to-do
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
	
	return view.getView(ENTITY_NAME,assetTypes, onAddNewClick, onSelectionChange, isChecked );
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