import * as React from 'react';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import "./static/css/ZonesoftTabs.css"
import AssetTypes from "./components/policy-engine-app/asset-types/AssetTypes"
import PolicyEngineApp2 from "./components/policy-engine-app-2/PolicyEngineApp"

function Home() {
	return (
		<Tabs>
			<TabList>
				<Tab>Setup Policies</Tab>
				<Tab>Setup Policies (Old Version)</Tab>
				<Tab>Manage Assets</Tab>
				<Tab>Examples etc</Tab>
			</TabList>

			<TabPanel>
				<AssetTypes />
			</TabPanel>
			<TabPanel>
				<PolicyEngineApp2 />
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