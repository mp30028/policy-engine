import React from 'react';
import Example1 from './example-1/Example1';
import Example2 from './example-2/Example2';
import Example3 from './example-3/Example3';

const Examples = () => {
	const MODULE = 	"Examples";
				
	return (
		<div>
			<h2> {MODULE}</h2>
			<hr/>
			<Example3 />			
			<hr/>
			<Example2 />
			<hr/>
			<Example1 />
		</div>
	);
};
export default Examples;