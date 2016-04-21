import React from 'react'
import ReactDOM from 'react-dom'

class Carousel extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			widthBase: 0,
			childrenCount: 0,
			index: 0,
			delay: 3000,
			transitionMs: 500,
			transition: false
		}

		this._autoPlay = this._autoPlay.bind(this);
		this._slidePrevNext = this._slidePrevNext.bind(this);
		this._setInterval = this._setInterval.bind(this);
		this._addTransition = this._addTransition.bind(this);
	}

	componentDidMount() {

		const base = ReactDOM.findDOMNode(this);
		const { delay, index } = this.state;
		const { children } = this.props;

		let intervalId = this._setInterval()

		this.setState({
			childrenCount: children.length,
			widthBase: base.offsetWidth,
			intervalId: intervalId
		})

		
	}

	_setInterval() {

		const { delay } = this.state

		return setInterval(this._autoPlay, delay)
	}

	_autoPlay() {

		const { delay, index, childrenCount } = this.state;
		const { children } = this.props;

		if(index < childrenCount - 1) {
			this.setState({
				index: index + 1,
				transition: true
			})
		} else {
			this.setState({
				index: 0,
				transition: true
			})
		}

		this._addTransition();
	}

	_dotActive(i) {

		const { delay, intervalId } = this.state

		clearInterval(intervalId)

		let interval = this._setInterval()

		this.setState({
			index: i,
			transition: true,
			intervalId: interval
		})

		this._addTransition();
	}

	_slidePrevNext(type) {

		const { index, childrenCount } = this.state;
		const { intervalId } = this.state

		clearInterval(intervalId)

		let interval = this._setInterval();

		switch(type) {
			case 'prev':
				if(index === 0) {
					this.setState({
						index: childrenCount - 1,
						transition: true,
						intervalId: interval
					})
				} else {
					this.setState({
						index: index - 1,
						transition: true,
						intervalId: interval
					})
				}
				break;
			case 'next':
				if(index === childrenCount - 1) {
					this.setState({
						index: 0,
						transition: true,
						intervalId: interval
					})
				} else {
					this.setState({
						index: index + 1,
						transition: true,
						intervalId: interval
					})
				}
				break;
		}

		this._addTransition();
	}

	_addTransition() {

		const { transitionMs } = this.state

		setTimeout(() => {
			this.setState({
				transition: false
			})
        }, transitionMs)
	}

	render () {

		const { children } = this.props
		const { widthBase, childrenCount, index, transition, transitionMs} = this.state

		let renderSlide = children.map((item, i) => {
			return (
				<div
					key={i} 
					className={`${i === index ? 'slide active' : 'slide'}`}
					style={{width: widthBase}}
				>
					{item}
				</div>
			)
		})

		let renderDot = () => {
			return (
				<ul>
				{
					children.map((item, i) => {
						return <li key={i} className={`dot-slide ${index === i ? 'active' : ''}`} onClick={this._dotActive.bind(this, i)}></li> 
					})
				}
				</ul>
			)
		}

		let renderPrevNext = () => {
			return (<div>
					<a className="slide-prev" onClick={this._slidePrevNext.bind(this, 'prev')}></a>
					<a className="slide-next" onClick={this._slidePrevNext.bind(this, 'next')}></a>
				</div>
			)
		}

		console.log(childrenCount - 1);

		let widthTransform = {
			width: widthBase * childrenCount,
			transform: `translate(-${widthBase * index}px, 0)`,
			transition: `${transition ? transitionMs : 0}ms`
		}

		return (
			<div className="carousel">
				{ renderPrevNext() }
				<div className="carousel-content" style={widthTransform}>
					{ renderSlide }
				</div>
				{ renderDot() }
			</div>
		)
	}
}

module.exports = Carousel;
