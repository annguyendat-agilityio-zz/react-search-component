var path = require('path');
var webpack = require('webpack');

module.exports = {
	entry: [
		'./src/Index.jsx' // Your appʼs entry point
	],

	output: {
		path: './lib',
		filename: 'component.js',
		library: ['component'],
		libraryTarget: 'umd'
	},

	module: {
		loaders: [
			// Compile jsx ES6 with bable
			{
				test: /\.jsx?$/,
				loaders: ['babel']
			},

			// Load scss
      {
        test: /\.scss$/,
        loaders: ['style', 'css', 'sass']
      }
		]
	},
};
