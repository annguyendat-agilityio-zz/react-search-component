import React from 'react'
import ReactDOM from 'react-dom'

class Carousel extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			widthBase: 0,
			childrenCount: 0,
			index: 0,
			delay: 3000
		}

		this._setInterval = this._setInterval.bind(this);
	}

	componentDidMount() {

		const base = ReactDOM.findDOMNode(this);
		const { delay, index } = this.state;
		const { children } = this.props;

		this.setState({
			childrenCount: children.length,
			widthBase: base.offsetWidth
		})

		setInterval(this._setInterval, delay)
	}

	_setInterval() {
		const { delay, index } = this.state;
		const { children } = this.props;

		if(index === 0) {
			this.setState({
				index: index + 1
			})
		} else if (index > 0 && index < children.length) {
			this.setState({
				index: index + 1
			})
		} else {
			this.setState({
				index: 0
			})
		}
	}

	render () {

		const { children } = this.props
		const { widthBase, childrenCount, index} = this.state

		let renderSlide = children.map((item, index) => {
			return (
				<div
					key={index} 
					className={`slide ${index}`}
					style={{width: widthBase, display: `inline-block`}}
				>
					{item}
				</div>
			)
		})

		let widthTransform = {
			width: widthBase * childrenCount,
			transform: `translate(-${widthBase * index}px, 0)` 
		}

		return (
			<div className="carousel">
				<div className="carousel-content" style={widthTransform}>
					{ renderSlide }
				</div>
			</div>
		)
	}
}

module.exports = Carousel;
