import React from 'react'
import { Modal } from '../../lib/component';

export default class ModalComponent extends React.Component {
	constructor(props) {
		super(props);

		this.state = {
			modalShow: false
		}

		this._closeModal = this._closeModal.bind(this)
		this._showModal = this._showModal.bind(this)
	}

	_closeModal() {
		this.setState({
			modalShow: false
		})
	}

	_showModal() {
		this.setState({
			modalShow: true
		})
	}

	render () {

		const { modalShow } = this.state;

		return (
			<div className={"modal-component"}>
				<h2>Modal</h2>
				<button onClick={this._showModal}>show Modal</button>
				<Modal closeModal={this._closeModal} showModal={modalShow}>
					<h3>Modal test</h3>
					<p>Lorem ipsum Aute dolore anim ut exercitation enim dolor cupidatat in id occaecat aliquip quis voluptate mollit commodo anim Ut commodo reprehenderit ullamco nulla fugiat Excepteur deserunt qui labore culpa aliqua minim veniam nisi Excepteur Ut incididunt eiusmod eu cupidatat mollit deserunt.</p>
				</Modal>
			</div>
		)
	}
}
