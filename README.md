# React search component

react-search-component is to provide a simple search

## Getting started
```
	npm install --save-dev react-search-component
```

## Usage
```jsx
	import Search from "react-search-component"
	import React from "react"
	import ReactDOM from 'react-dom'

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

	export default class TestComponent extends React.Component {
		constructor(props) {
			super(props);

			this._handleSearch = this._handleSearch.bind(this);
		}

		_handleSearch(value) {

			console.log(value);
		}

	  render () {

	    return (
	    	<div>
		      <Search data={data} keySearch={'name'} getValueSearch={this._handleSearch}/>
			</div>
	    )
	  }
	}

```

## Props:
#### `data` (required)
List of Items to filter through either an array of Object
* data is a array
#### `keySearch` (required)
The search key to match when searhching
#### `getValueSearch` (required)
getValueSearch is a function return value search
