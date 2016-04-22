import React from 'react'
import ReactDOM from 'react-dom'
import { Carousel } from '../../lib/component';

export default class CarouselComponent extends React.Component {
	constructor(props) {
		super(props);

	}

	render () {

		return (
			<div>
				<Carousel>
					<img src="https://raw.githubusercontent.com/jerryshew/design/master/png/ambition-morty.png"/>
					<h1>test 1</h1>
					<h2>test 2</h2>
					<h3>test 3</h3>
					<h4>test 4</h4>
					<img src="https://raw.githubusercontent.com/jerryshew/design/master/png/awkward-morty.png"/>
				</Carousel>
			</div>
		)
	}
}
