import * as React from 'react';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import "./static/css/ZonesoftTabs.css"
import ManageAssetTypes from "./components/manage-asset-types/ManageAssetTypes"
import Examples from './examples/Examples';

function Home() {
	return (
		<Tabs>
			<TabList>
				<Tab key={1}>Manage Asset Types</Tab>
				<Tab key={2}>Manage Policies</Tab>
				<Tab key={3}>Examples etc</Tab>
			</TabList>

			<TabPanel key={1}>
				<ManageAssetTypes />
			</TabPanel>
			
			<TabPanel key={2}>
				<h2>Managing Policies will go here</h2>
			</TabPanel>
			
			<TabPanel key={3}>
				<Examples />
			</TabPanel>

		</Tabs>
	);
};

export default Home;