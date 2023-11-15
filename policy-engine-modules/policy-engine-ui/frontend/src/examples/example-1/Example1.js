import React from 'react';

const Example1 = () => {
	const MODULE = 	"Example-1";
	const dataManager = new DataManager();			
	return (
		<div>
			Hello from {MODULE}<br/><br/><br/>
			<ConsumerA dataManager={dataManager}/><br/><br/><br/>
			<ConsumerB dataManager={dataManager}/><br/><br/><br/>
		</div>
	);
};

export default Example1;

class DataManager {
 	#sharedValue1 = "this is the first shared value";
	#sharedValue2 = "this is the second shared value";
	
	getSharedValue1 = () =>{
		return this.#sharedValue1;
	}
	
	getSharedValue2 = () =>{
		return this.#sharedValue2;
	}	
}

const ConsumerA = (props) =>{
	const MODULE = "Example-1.ConsumerA";
	return (
		<div>
			FROM: {MODULE} <br/>
			shared-value-1 = {props.dataManager.getSharedValue1()} <br/>
			shared-value-2 = {props.dataManager.getSharedValue2()} <br/>
		</div>
	);
}

const ConsumerB = (props) =>{
	const MODULE = "Example-1.ConsumerB";
	return (
		<div>
			FROM: {MODULE} <br/>
			shared-value-1 = {props.dataManager.getSharedValue1()} <br/>
			shared-value-2 = {props.dataManager.getSharedValue2()} <br/>
		</div>
	);
}