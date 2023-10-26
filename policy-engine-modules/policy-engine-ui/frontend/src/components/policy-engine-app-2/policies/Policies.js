import { useState, useEffect } from 'react';
import "../../../static/css/Zonesoft.css"
import ApiClientConfigs from "../../../classes/configurations/ApiClientConfigs.class";
import DataService from "../../../classes/data-services/DataService.class";
import View from './View';

function Policies(props) {
	const ENTITY_NAME = "policy";
	const view = new View();
	const emptyPolicies = [];
	const [policies, setPolicies] = useState(emptyPolicies);
	const [selected, setSelected]= useState(null);
	
	useEffect(() => {
		const getAssociatedPolicyIdsFromAssetTypes = (assetTypes) =>{
			const deDupe = (inArray) => [...new Set(inArray)];		
			const policyIds = assetTypes.flatMap(at => (at.associatedPolicies).map(p => p.id));
			return deDupe(policyIds);
		}
				
		if(props.selectedAssetTypes){
			const dataService = new DataService(new ApiClientConfigs(),ENTITY_NAME);
			dataService.fetchByIds(getAssociatedPolicyIdsFromAssetTypes(props.selectedAssetTypes)).then((data) => setPolicies(data));						
		}else{
			console.warn("Policies:useEffect:props.selectedAssetTypes is not set");
			setPolicies([]);
		}
	}, [props.selectedAssetTypes]);	

	useEffect(() => {		
		setSelected((selected)? policies.find(p => p.id === selected.id) : null);
	}, [policies,selected]);
	
	useEffect(() => {
		props.selectedPolicySetter(selected);
	}, [props, selected]);
	
	const onAddNewClick = () =>{
		//to-do
	}
	
	const onSelectionChange = (event) =>{
		selectHandler(event, policies, selected, setSelected);				
	}
		
	const isChecked = (id) =>{		
		const getTargetDataItem = () => {
			return policies.find(x => x.id === id);	
		};		
		return isSelected(selected, getTargetDataItem());
	}	
	
	return view.getView(ENTITY_NAME,policies, onAddNewClick, onSelectionChange, isChecked );
};

	const isSelected = (selected, targetDataItem) =>{	
		if (selected){
			return (selected.id === targetDataItem.id);
		}else{
			return false;
		} 
	};

	const selectHandler = (event, data,selected, setSelected) =>{
		const getTargetDataItem = () => {
			return data.find(x => x.id === parseInt(event.target.value));	
		};
				
		const targetDataItem = getTargetDataItem();
		
		if (targetDataItem){
			if (isSelected(selected, targetDataItem)){
				setSelected(null);	
			}else{
				setSelected(targetDataItem);
			}			
		}else{
			setSelected(null);
		}	
	};

export default Policies;