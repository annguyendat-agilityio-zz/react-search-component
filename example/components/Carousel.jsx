import React from 'react'
import ReactDOM from 'react-dom'
// import Carousel from './test.jsx'
import { Carousel } from '../../lib/component';

export default class CarouselComponent extends React.Component {
	constructor(props) {
		super(props);

	}

	componentDidMount() {
		const base = ReactDOM.findDOMNode(this);
		console.log(base.offsetWidth);
	}

	render () {

		return (
			<div>
				<Carousel>
					<img src="https://raw.githubusercontent.com/jerryshew/design/master/png/ambition-morty.png"/>
					<img src="https://raw.githubusercontent.com/jerryshew/design/master/png/awkward-morty.png"/>
					<img src="https://raw.githubusercontent.com/jerryshew/design/master/png/awkward-morty.png"/>
					<img src="https://raw.githubusercontent.com/jerryshew/design/master/png/awkward-morty.png"/>
				</Carousel>
			</div>
		)
	}
}
