# React search component

react-search-component is to provide a simple search

## Getting started
```
	npm install --save-dev react-search-component
```

## Usage:
## `Search Component`
### Props:
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

### Example:

```jsx
	import { Search } from 'react-simple-component';
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
					<Search objectResponse={'users'}
						callBackBackEnd={this._callBack}
						getValueSearch={this._handleSearch} />
				</div>
			)
		}
	}
```
## `Modal Component`
### Props:
#### `showModal` is a `boolean`
show modal if's `true`, close modal if's `false`
#### `closeModal` is a `function`
Handle change showModal to false
#### `closeIcon` is a `element`
if's undefined use element icon close default

### Example:

```jsx
	import { Modal } from 'react-simple-component';
	import React from 'react'

	export default class ModalComponent extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			modalShow: false
		}

		this._closeModal = this._closeModal.bind(this)
		this._showModal = this._showModal.bind(this)
	}

	_closeModal() {
		this.setState({
			modalShow: false
		})
	}

	_showModal() {
		this.setState({
			modalShow: true
		})
	}

	render () {

		const { modalShow } = this.state;

		return (
			<div className={"modal-component"}>
				<h2>Modal</h2>
				<button onClick={this._showModal}>show Modal</button>
				<Modal closeModal={this._closeModal} showModal={modalShow}>
					<h3>Modal test</h3>
					<p>Lorem ipsum Aute dolore anim ut exercitation enim dolor cupidatat in id occaecat aliquip quis voluptate mollit commodo anim Ut commodo reprehenderit ullamco nulla fugiat Excepteur deserunt qui labore culpa aliqua minim veniam nisi Excepteur Ut incididunt eiusmod eu cupidatat mollit deserunt.</p>
				</Modal>
			</div>
		)
	}
}
```
