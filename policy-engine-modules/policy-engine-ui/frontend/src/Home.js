import * as React from 'react';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import "./static/css/ZonesoftTabs.css"
import PolicyEngineApp from "./components/policy-engine-app/PolicyEngineApp"

function Home() {
	return (
		<Tabs>
			<TabList>
				<Tab>Setup Policies</Tab>
				<Tab>Manage Assets</Tab>
				<Tab>Examples etc</Tab>
			</TabList>

			<TabPanel>
				<PolicyEngineApp />
			</TabPanel>
			<TabPanel>
				<h2>Managing Assets etc will go here</h2>
			</TabPanel>
			<TabPanel>
				<h2>Examples etc will go here</h2>
			</TabPanel>

		</Tabs>
	);
};

export default Home;