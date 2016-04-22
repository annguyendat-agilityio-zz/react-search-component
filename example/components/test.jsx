import React from 'react'
import ReactDOM from 'react-dom'

class Carousel extends React.Component {
	static get propTypes () {
		return {
			delayAutoPlay: React.PropTypes.number,
			timeTransition: React.PropTypes.number,
			arrowPrevNext: React.PropTypes.bool,
			dotSlide: React.PropTypes.bool,
			autoPlay: React.PropTypes.bool
		}
	}

	constructor(props) {
		super(props);

		this.state = {
			childrenCount: 0,
			widthBase: 0,
			index: 0,
			autoPlay: this.props.autoPlay !== undefined ?
						this.props.autoPlay :
						true,
			arrowPrevNext: this.props.arrowPrevNext !== undefined ?
							this.props.arrowPrevNext :
							true,
			dotSlide: this.props.dotSlide !== undefined ?
							this.props.dotSlide :
							true,
			delayAutoPlay: this.props.delayAutoPlay !== undefined ?
							this.props.delayAutoPlay :
							3000,
			timeTransition: this.props.timeTransition !== undefined ?
							this.props.timeTransition :
							500,
			transition: false
		}

		this._autoPlay = this._autoPlay.bind(this);
		this._setInterval = this._setInterval.bind(this);
		this._resetIndex = this._resetIndex.bind(this);
	}

	componentDidMount() {

		// get element parent component
		const base = ReactDOM.findDOMNode(this);
		const { index } = this.state;
		const { children } = this.props;

		this.setState({

			// Count children
			childrenCount: children.length,

			// set width for component
			widthBase: base.offsetWidth,

			// set Interval for auto play slide
			intervalId: this._setInterval()
		})		
	}

	componentWillUnmount() {

		const { intervalId } = this.state

		clearInterval(intervalId)
	}

	// setInterval for auto play slide
	_setInterval() {

		const { delayAutoPlay, autoPlay } = this.state

		if(autoPlay) {
			return setInterval(this._autoPlay, delayAutoPlay)
		}
	}

	// Handle Auto play slide
	_autoPlay() {

		const { index, childrenCount } = this.state;
		const { children } = this.props;

		if(index < childrenCount) {
			this.setState({
				index: index + 1,
				transition: true
			})
		}

		this._resetIndex(index + 1)
	}

	// Handle dot slide
	_dotActive(i) {

		const { intervalId } = this.state

		clearInterval(intervalId)

		this.setState({
			index: i,
			transition: true,
			intervalId: this._setInterval()
		})

		this._resetIndex(i);
	}

	// Handle Prev and Next arrow slide
	_slidePrevNext(type) {

		const { index, childrenCount, intervalId } = this.state;

		clearInterval(intervalId)

		switch(type) {
			
			case 'prev':

				if(index >= 0) {
					this.setState({
						index: index - 1,
						transition: true,
						intervalId: this._setInterval()
					})
				}

				this._resetIndex(index - 1)
				break;

			case 'next':

				if(index < childrenCount) {
					this.setState({
						index: index + 1,
						transition: true,
						intervalId: this._setInterval()
					})
				}

				this._resetIndex(index + 1);
				break;
		}
	}

	// Handle reset index to first and last slide, remove transition 
	_resetIndex(index) {

		const { timeTransition, childrenCount } = this.state

		setTimeout(() => {

			if(index === -1) {
				this.setState({
					index: childrenCount - 1
				})
			}

			if(index === childrenCount) {
				this.setState({
					index:  0
				})
			}

			this.setState({
				transition: false
			})
        }, timeTransition)
	}

	render () {

		const { children } = this.props
		const { 
			widthBase,
			childrenCount,
			index,
			transition,
			timeTransition,
			dotSlide,
			arrowPrevNext } = this.state

		// show slide
		let renderSlide = () => {

			let _children = [];

			for(let i = -1, _len = childrenCount; i < _len + 1 ; i ++) {

				let _index = i,
					active = index === i ? `slide active` : `slide`;

				if (_index === -1) {
					_index = _len - 1;
				}

				if (_index === _len) {
					_index = 0;
				}

				_children.push(
					<div
						key={i} 
						className={active}
						style={{width: widthBase}}
					>
						{ children[_index] }
					</div>
				)
			}

			return _children
		}

		// show dot slide
		let renderDot = () => {

			if(dotSlide) {
				return (
					<ul>
						{
							children.map((item, i) => {

								let dotStyle = index === i ? 'dot-slide active' : 'dot-slide'

								return <li
											key={i}
											className={dotStyle}
											onClick={this._dotActive.bind(this, i)}
										></li> 
							})
						}
					</ul>
				)
			}
		}

		// show prev and next arrow
		let renderPrevNext = () => {

			if(arrowPrevNext) {
				return (
					<div>
						<a
							className="slide-prev"
							onClick={this._slidePrevNext.bind(this, 'prev')}
						></a>
						<a
							className="slide-next"
							onClick={this._slidePrevNext.bind(this, 'next')}
						></a>
					</div>
				)
			}
		}

		let widthTransform = {
			width: widthBase * (childrenCount + 2),
			transform: `translate(-${widthBase * (index + 1)}px, 0)`,
			transition: `${transition ? timeTransition : 0}ms`
		}

		return (
			<div className="carousel">
				{ renderPrevNext() }
				<div
					className="carousel-content"
					style={widthTransform}
				>
					{ renderSlide() }
				</div>
				{ renderDot() }
			</div>
		)
	}
}

module.exports = Carousel;
