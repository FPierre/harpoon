@Categories = React.createClass
  getInitialState: ->
    categories: @props.data
  getDefaultProps: ->
    categories: []
  render: ->
    React.DOM.div
      className: 'collection'
      for c in @state.categories
        React.createElement Category, key: c.id, c: c
