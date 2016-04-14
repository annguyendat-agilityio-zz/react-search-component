import TestComponent from "./TestComponent";
import ReactDOM from 'react-dom'
import React from 'react'

function main() {

	const app = document.createElement('div');

	document.body.appendChild(app);

	ReactDOM.render(<TestComponent />, app)
}

main();
