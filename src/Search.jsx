import './search.scss'
import React from 'react'

class Search extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			data: this.props.data ? this.props.data : [],
			keySearch: this.props.keySearch ? this.props.keySearch : null,
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
	}

	// Handle when user change input search
	_onChangeSearch(evt) {

		const state = this.state;

		let inputSearch = evt.target.value,
				keySearch = state.keySearch,
				dataSearch = [];

  	// Check data and input not null
		if(state.data.length > 0 && inputSearch !== '' && keySearch !== null) {

			state.data.map((item, index) => {

				// Create regular expression for input search
				let inputSearchRegExp = new RegExp(inputSearch, 'gi');

				// Test input search with item in data, push the items true to a new array
				if(item[keySearch]) {
					return inputSearchRegExp.test(item[keySearch]) && index < 5 ?  dataSearch.push(item[keySearch]) : '';
				}
			}) 
		}

		// set state for input search, data search, loading
		this.setState({
			inputSearch: inputSearch ? inputSearch : '',
			dataSearch: dataSearch,
			indexSelect: 0,
			isLoading: true
		})

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
  		} else if(!state.isLoading && state.dataSearch.length > 0 && state.inputSearch !== null) {

  			return (
  				<ul>
  				{
  					state.dataSearch.map((item, index) => {

  						// Create regular expression for input search
							let inputSearchRegExp = new RegExp(state.inputSearch, 'gi');

							// Bold value search
							let itemTestBold = item.replace(inputSearchRegExp,"<strong>$&</strong>");

  						return <li onClick={this._onClickSelect.bind(this, index)} onMouseOver={this._onMouseOverSelect.bind(this, index)} className={state.indexSelect === index ? 'search-item search-item-active' : 'search-item'} key={index} dangerouslySetInnerHTML={{__html: itemTestBold}}></li>
  					})
  				}
  				</ul>
  			)
  		}
  	}

  	const clearReander = () => {
  		if(state.inputSearch !== '') {
  			return (<button className='search-clear' onClick={this._onClear}></button>)
  		}
  	}

    return (
      <div className='wrapper-search'>
	      <div className={'wrapper-search-input'} >
					<input onChange={this._onChangeSearch}
						onKeyDown={this._onKeyDownSelect}
						value={this.state.inputSearch}
						className={'search-default'}
						type='type'
						placeholder='input search'/>
					{ clearReander() }
				</div>
				{ renderDataSearch() }
			</div>
    )
  }
}

Search.propTypes = {
	data: React.PropTypes.array.isRequired,
	keySearch: React.PropTypes.string.isRequired,
	getValueSearch:  React.PropTypes.func.isRequired,
};

module.exports = Search;
