import React, { useState } from 'react';

const Example3 = () => {
	const MODULE = 	"Example-3";	
//	const [sharedValue1, setSharedValue1]= useState("first value");
//	const [sharedValue2, setSharedValue2]= useState("second value");
	const sharedValue1State = useState("first value");
	const sharedValue2State = useState("second value");

	const clickCountState = useState(0);
	const dataManager = new DataManager(sharedValue1State, sharedValue2State, clickCountState);
	
	return (
		<div>
			Hello from {MODULE}<br/><br/><br/>
			<ConsumerA dataManager={dataManager}/><br/><br/><br/>
			<ConsumerB dataManager={dataManager}/><br/><br/><br/>
		</div>
	);
};

export default Example3;

class DataManager{
				
	constructor(state1, state2, clickCountState) {
		this.state1 = state1;
		this.state2 = state2;
		this.clickCountState = clickCountState;
	}
	
	getSharedValue1 = () =>{
		return this.state1[0];
	}
	
	getSharedValue2 = () =>{
		return this.state2[0];
	}
	
	setSharedValue1 = (value) => {
		const updateValue = value + " [" + this.clickCountState[0] + "]";
		this.clickCountState[1](this.clickCountState[0] + 1);
		this.state1[1](updateValue);
	}
	
	setSharedValue2 = (value) => {
		this.state2[1](value);
	}	
}

const ConsumerA = (props) =>{
	const MODULE = "Example-3.ConsumerA";
	
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
	const MODULE = "Example-3.ConsumerB";
	
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