import React from 'react'

class Modal extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			showModal: this.props.showModal !== undefined ? this.props.showModal : false,
			// Element close icon default if undefined
			closeIcon: this.props.closeIcon !== undefined ? this.props.closeIcon : <span className="modal-close" onClick={this._closeModal.bind(this)}></span>
		}

		this._closeModal = this._closeModal.bind(this);
	}

	static get propTypes () {
		return {
			closeModal: React.PropTypes.func.isRequired,
			showModal: React.PropTypes.bool,
			closeIcon: React.PropTypes.element
		}
	}

	// Handle close modal
	_closeModal() {

		this.props.closeModal();

		thus.setState({
			showModal: false
		})
	}

	render () {

		const { children, showModal, closeIcon, closeModal } = this.props;

		// Show modal
		let className = showModal ? 'modal show' : 'modal';

		return (
			<div className={className}>
				<div className="modal-overlay" onClick={this._closeModal}></div>
				<div className="modal-content">
					{ this.state.closeIcon }
					{ children }
				</div>
			</div>
		)
	}
}

module.exports = Modal;
