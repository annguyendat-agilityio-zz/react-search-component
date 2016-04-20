import React from 'react';
import ReactDOM from 'react-dom';
import { Link } from 'react-router';

export default class App extends React.Component {
	render() {
		return ( 
			<div className="container">
				<header className="header">
					<h1>React Component</h1>
				</header>
				<div className="wrapper">
					 <nav className="navigation-left">
						<h2>Components</h2>
						<ul>
							<li>
								<Link className="navigation-item" to={'/search'}>search</Link>
							</li>
							<li>
								<Link className="navigation-item" to={'/modal'}>Modal</Link>
							</li>
						</ul>
					</nav>
					<div className="warpper-children">
						{this.props.children}
					</div>
				</div>
			</div>
		);
	}
}
