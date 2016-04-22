import React from 'react'

class Search extends React.Component {

	static get propTypes () {
		return {
			data: React.PropTypes.array,
			keySearch: React.PropTypes.string,
			objectResponse: React.PropTypes.string,
			callBackBackEnd: React.PropTypes.func,
			getValueSearch:  React.PropTypes.func
		}
	}
	constructor(props) {
		super(props);
		this.state = {
			dataSearch: [],
			inputSearch: '',
			indexSelect: 0,
			isLoading: false
		}

		this._onChangeSearch = this._onChangeSearch.bind(this);
		this._onKeyDownSelect = this._onKeyDownSelect.bind(this);
		this._onClickSelect = this._onClickSelect.bind(this);
		this._onClear = this._onClear.bind(this);
		this._handleSearch = this._handleSearch.bind(this);
		this._setStateSearch = this._setStateSearch.bind(this);
	}

	// set state for input search, data search, loading
	_setStateSearch(response, inputSearch) {

		
		this.setState({
			inputSearch: inputSearch,
			dataSearch: response,
			indexSelect: 0,
			isLoading: true
		})
	}

	// Handle when user change input search
	_onChangeSearch(evt) {

		const state = this.state,
			props = this.props;

		let inputSearch = evt.target.value,
			dataSearch;

		// Call function fetching and handling data from an Back End
		if(props.callBackBackEnd !== undefined && props.objectResponse !== undefined && inputSearch !== '') {

			props.callBackBackEnd(inputSearch).then((response) => {

				if (response.data[props.objectResponse] !== undefined) {

					this._setStateSearch(response.data[props.objectResponse], inputSearch)
				}
			})

		// Handle search from data user
		} else if (props.data !== undefined && props.keySearch !== undefined && inputSearch !== '') {

			dataSearch = [];

			props.data.map((item, index) => {

				// Create regular expression for input search
				let inputSearchRegExp = new RegExp(inputSearch, 'gi');

				let itemSearch = item[props.keySearch]

				// Test input search with item in data, push the items true to a new array
				if(itemSearch) {
					return inputSearchRegExp.test(itemSearch) && index < 5 ?  dataSearch.push(itemSearch) : '';
				}
			})

			// set state for input search, data search, loading
			this._setStateSearch(dataSearch, inputSearch)

		} else {
			this.setState({
				inputSearch: inputSearch
			})
		}

		// set time out for loading when user change input search
		if (!state.isLoading) {
			setTimeout(() =>{
				this.setState({
					isLoading: false
				})
			}, 500)
		}
	}

	// select value search with key down
	_onKeyDownSelect(evt) {

		const state = this.state;

		// when user use arrow up select value search
		if(evt.keyCode === 38 && state.indexSelect > 0) {

			this.setState({
				indexSelect: state.indexSelect - 1,
			})

			// when user use arrow down select value search
		} else if(evt.keyCode === 40 && state.indexSelect < (state.dataSearch.length - 1)) {

			this.setState({
				indexSelect: state.indexSelect + 1
			})

			// when user select value search and enter
		} else if(evt.keyCode === 13) {

			let valSearch = state.dataSearch && state.dataSearch.length > 0 ? state.dataSearch[state.indexSelect] : state.inputSearch;

			this.setState({
				inputSearch: valSearch,
				dataSearch: []
			})

			this._handleSearch(valSearch);
		}
	}

	// select value search when user use mouse left click
	_onClickSelect(index) {

		const state = this.state;

		this.setState({
			indexSelect: index,
			inputSearch: state.dataSearch && state.dataSearch.length > 0 ? state.dataSearch[index] : state.inputSearch,
			dataSearch: []
		})
	}

	// hight light item search when user hover on item
	_onMouseOverSelect(index) {
		this.setState({
			indexSelect: index
		})
	}

	// Clear value input search, data search
	_onClear() {

		this.setState({
			dataSearch: [],
			inputSearch: '',
			indexSelect: 0,
			isLoading: false
		})
	}

	// return value search
	_handleSearch(value) {

		this.props.getValueSearch(value);
	}

	render () {

		const state = this.state;

		const renderDataSearch = () => {

  		// render loading when the user is changing input search
  		if(state.isLoading) {
  			return (<ul>
  				<li className='loading-search'>
  				<div className='loading-border loading-right'></div>
  				<div className='loading-border loading-left'></div>
  				<div className='loading-border loading-mid'></div>
  				</li>
  				</ul>
  				)
  			// render the value search when input search not null
  		} else if(!state.isLoading && state.dataSearch.length > 0 && state.inputSearch !== '') {

  			return (
  				<ul>
  				{
  					state.dataSearch.map((item, index) => {

  						// Create regular expression for input search
  						let inputSearchRegExp = new RegExp(state.inputSearch, 'gi');

							// Bold value search
							let itemTestBold = item.replace(inputSearchRegExp,"<strong>$&</strong>");

							return <li 
										onClick={this._onClickSelect.bind(this, index)} 
										onMouseOver={this._onMouseOverSelect.bind(this, index)} 
										className={state.indexSelect === index ? 'search-item search-item-active' : 'search-item'}
										key={index}
										dangerouslySetInnerHTML={{__html: itemTestBold}}>
									</li>
						})
  				}
  				</ul>
  				)
  		}
  	}

  	// Show button clear search
  	const clearReander = () => {
  		if(state.inputSearch !== '') {
  			return (<button
  						className='search-clear'
  						onClick={this._onClear} >
  					</button>)
  		}
  	}

  	return (
  		<div className='wrapper-search'>
	  		<div className={'wrapper-search-input'} >
		  		<input
		  			onChange={this._onChangeSearch}
		  			onKeyDown={this._onKeyDownSelect}
		  			value={this.state.inputSearch}
		  			className={'search-default'}
		  			type='type'
		  			placeholder='input search'
		  		/>
		  		{ clearReander() }
		  	</div>
	  		{ renderDataSearch() }
  		</div>
  		)
	}
}

module.exports = Search;
