import React, { useState } from 'react';

const Example2 = () => {
	const MODULE = 	"Example-2";	
	const [sharedValue1, setSharedValue1]= useState("first value");
	const [sharedValue2, setSharedValue2]= useState("second value");
	const [clickCount, setClickCount] = useState(0);
	const dataManager = new DataManager(sharedValue1,setSharedValue1,  sharedValue2, setSharedValue2, clickCount, setClickCount);
	
	return (
		<div>
			Hello from {MODULE}<br/><br/><br/>
			<ConsumerA dataManager={dataManager}/><br/><br/><br/>
			<ConsumerB dataManager={dataManager}/><br/><br/><br/>
		</div>
	);
};

export default Example2;

class DataManager{
				
	constructor(state1, setState1, state2, setState2, clickCount, setClickCount) {
		this.state1 = state1;
		this.state2 = state2;
		this.setState1 = setState1;
		this.setState2 = setState2;
		this.clickCount = clickCount;
		this.setClickCount = setClickCount;
	}
	
	getSharedValue1 = () =>{
		return this.state1;
	}
	
	getSharedValue2 = () =>{
		return this.state2;
	}
	
	setSharedValue1 = (value) => {
		const updateValue = value + " [" + this.clickCount + "]";
		this.setClickCount(this.clickCount + 1);
		this.setState1(updateValue);
	}
	
	setSharedValue2 = (value) => {
		this.setState2(value);
	}	
}

const ConsumerA = (props) =>{
	const MODULE = "Example-2.ConsumerA";
	
	const onClickHandler = () => {
		props.dataManager.setSharedValue1("I have been changed");		
	}
	
	return (
		<div>
			FROM: {MODULE} <br/>
			shared-value-1 = {props.dataManager.getSharedValue1()} <br/>
			shared-value-2 = {props.dataManager.getSharedValue2()} <br/>
			<input type='button' onClick={onClickHandler} value='Change Value 1' />
		</div>
	);
}

const ConsumerB = (props) =>{
	const MODULE = "Example-2.ConsumerB";
	return (
		<div>
			FROM: {MODULE} <br/>
			shared-value-1 = {props.dataManager.getSharedValue1()} <br/>
			shared-value-2 = {props.dataManager.getSharedValue2()} <br/>
		</div>
	);
}