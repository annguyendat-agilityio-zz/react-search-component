# React search component

react-search-component is to provide a simple search

## Getting started
```
	npm install --save-dev react-search-component
```

## Usage
```jsx
	import Search from '../lib/search';
	import React from 'react'
	import axios from 'axios'
	import MockAdapter from 'axios-mock-adapter'

	const data = [
		{
			id: 1,
			name: "an"
		},
		{
			id: 2,
			name: "dant"
		},
		{
			id: 3,
			name: "dant_1"
		},
		{
			id: 4,
			name: "dant_2"
		},
		{
			id: 5,
			name: "dant_3 dant da"
		}
	]

	const keySearch = 'name';

	export default class TestComponent extends React.Component {
		constructor(props) {
			super(props);

			this._callBack = this._callBack.bind(this);

		}

		componentDidMount() {

			var mock = new MockAdapter(axios);

			mock.onGet('/users').reply(200, {
				users: ['call_1', 'call_2', 'call_3', 'call_4', 'call_5']
			});
		}

		_callBack() {
			return axios.get('/users')
		}

		_handleSearch(value) {
			console.log(value);
		}

		render () {

			return (
				<div>
					// Search with data 				
					<Search keySearch={'name'} 
						data={data}
						getValueSearch={this._handleSearch} />

					// Search with call back end
					<Search objectRespone={'users'}
						callBackBackEnd={this._callBack}
						getValueSearch={this._handleSearch} />
				</div>
			)
		}
	}
```

## Props:
#### `data` is a `array`
List of Items to filter through either an array of Object
#### `keySearch` is a `string`
The search key to match when searhching
#### `objectResponse` is a `string` use with `callBackBackEnd`
Object of response when backend return
#### `callBackBackEnd` is a `function`
Call function fetching and handling data from an Back End
#### `getValueSearch`
getValueSearch is a function return value search
