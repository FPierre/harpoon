@Categories = React.createClass
  getInitialState: ->
    news: @props.data
  getDefaultProps: ->
    categories: []
  render: ->
    React.DOM.ul
      className: ''
      for c in @state.categories
        React.createElement Category, key: c.id, c: c
