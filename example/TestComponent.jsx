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
				<Search keySearch={'name'} data={data} getValueSearch={this._handleSearch} />

				// Search with call back end
				<Search objectRespone={'users'} callBackBackEnd={this._callBack} getValueSearch={this._handleSearch} />
			</div>
		)
	}
}
