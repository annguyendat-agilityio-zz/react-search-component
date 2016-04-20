import './scss/index.scss'
import ReactDOM from 'react-dom'
import React from 'react'
import { Router, Route, IndexRoute, Link, browserHistory } from 'react-router';

import App from './App';

import SearchComponent from './components/Search';
import ModalComponent from './components/Modal';

function main() {

	const app = document.createElement('div');

	document.body.appendChild(app);

	ReactDOM.render(
		<Router history={browserHistory}>
	      <Route path="/" component={App}>
		      <Route path="/search" component={SearchComponent}/>
		      <Route path="/modal" component={ModalComponent}/>
	      </Route>
	    </Router>, app)
}

main();
