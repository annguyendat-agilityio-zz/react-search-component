import Search from '../lib/search';
import React from 'react'

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
const keyId = 'id';

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
	      <Search data={data} keySearch={keySearch} getValueSearch={this._handleSearch}/>
			</div>
    )
  }
}
