var path = require('path');
var HtmlwebpackPlugin = require('html-webpack-plugin');
var webpack = require('webpack');
var promise = require('es6-promise').polyfill();
var merge = require('webpack-merge');
var TransferWebpackPlugin = require('transfer-webpack-plugin');
var pkg = require('./package.json');

var ROOT_PATH = path.resolve(__dirname);
var EXAMPLE_PATH = path.resolve(ROOT_PATH, 'example');

module.exports = {
	entry: [
		'webpack-dev-server/client?http://0.0.0.0:8000', // WebpackDevServer host and port
		'webpack/hot/only-dev-server', // "only" prevents reload on syntax errors
		'./example/index.jsx' // Your appʼs entry point
	],

	devtool: 'eval-source-map',

	devServer: {
		historyApiFallback: true,
		hot: true,
		inline: true,
		progress: true
	},

	resolve: {
		extensions: ['', '.js', '.jsx'] // resolve extensions js, jsx
	},

	output: {
		path: EXAMPLE_PATH,
		filename: 'bundle.js'
	},
	
	module: {
		loaders: [
			// Compile jsx ES6 with bable
			// add React-hot loader
			{
				test: /\.jsx?$/,
				loaders: ['react-hot', 'babel'],
				include: EXAMPLE_PATH
			},

			// Load scss
      {
        test: /\.scss$/,
        loaders: ['style', 'css', 'sass']
      }
		]
	},

	plugins: [
		new webpack.HotModuleReplacementPlugin(),
		new HtmlwebpackPlugin({
			title: 'react redux',
			template: './example/index.html'
		})
	]
};
