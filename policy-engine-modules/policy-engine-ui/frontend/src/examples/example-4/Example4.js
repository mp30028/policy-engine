import React, { useState } from 'react';

const Example4 = () => {
	const MODULE = 	"Example-4";
	const [state1, setState1] = useState("first value");
	const [state2, setState2] = useState("second value");
	const [clickCount, setClickCount] = useState(0);	
	
	
	const useDataManager = () => {
				

		const setSharedValue1 = (value) => {
			const updatedValue = value + " [" + clickCount + "]";
			setClickCount(clickCount + 1);
			setState1(updatedValue);
		}
		
		return [state1, setSharedValue1, state2, setState2];
	}	
	
	return (
		<div>
			Hello from {MODULE}<br/><br/><br/>
			<ConsumerA dataManager={useDataManager}/><br/><br/><br/>
			<ConsumerB dataManager={useDataManager}/><br/><br/><br/>
		</div>
	);
};

export default Example4;


const ConsumerA = (props) =>{
	const MODULE = "Example-4.ConsumerA";
	
	const [sharedValue1, setSharedValue1, sharedValue2]= props.dataManager();
	
	const onClickHandler = () => {
		setSharedValue1("I have been changed");		
	}
	
	return (
		<div>
			FROM: {MODULE} <br/>
			shared-value-1 = {sharedValue1} <br/>
			shared-value-2 = {sharedValue2} <br/>
			<input type='button' onClick={onClickHandler} value='Change Value 1' />
		</div>
	);
}

const ConsumerB = (props) =>{
	const MODULE = "Example-4.ConsumerB";
	
	const [sharedValue1, setSharedValue1, sharedValue2]= props.dataManager();
	
	const onClickHandler = () => {
		setSharedValue1("I have been changed");		
	}
		
	return (
		<div>
			FROM: {MODULE} <br/>
			shared-value-1 = {sharedValue1} <br/>
			shared-value-2 = {sharedValue2} <br/>
			<input type='button' onClick={onClickHandler} value='Change Value 1' />
		</div>
	);
}