'use strict';

const http = require('http');

jest.unmock('../src/Search.jsx');

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import {findWithType, findAllWithType} from 'react-shallow-testutils';
import Search from '../src/Search.jsx';
import axios from 'axios'
import MockAdapter from 'axios-mock-adapter'

let input,
		component,
		callb

describe('Search component', () => {

	it('should render correctly', () => {

		component = TestUtils.renderIntoDocument(<Search />);

		input = TestUtils.findRenderedDOMComponentWithTag(component, 'input');

		expect(input.type).toEqual('type');
	})

	it('search data local returns correctly', () => {

		const data = [
			{
				id: 1,
				name: 'an'
			},
			{
				id: 2,
				name: 'dant'
			},
			{
				id: 3,
				name: 'name'
			}
		]

		component = TestUtils.renderIntoDocument(<Search data={data} keySearch={'name'} />);

		input = TestUtils.scryRenderedDOMComponentsWithTag(component, 'input');

		input[0].value = 'an'

		TestUtils.Simulate.change(input[0]);

		component.setState({
			isLoading: false
		})

		let listItem = TestUtils.scryRenderedDOMComponentsWithTag(component, 'li');
	
		expect(listItem.length).toEqual(2);
	});

	pit('search data from back end', async () => {

		callb = function callBack() {
			return new Promise((resolve, reject) => {
				resolve(
					{
						data: {
							users: ['an', 'nam']
						}
					}
				)
			})
		}

		component = TestUtils.renderIntoDocument(<Search
			objectResponse={'users'}
			callBackBackEnd={callb} />);

		const promise = await component.props.callBackBackEnd();

		expect(promise.data.users.length).toEqual(2);
	});
});