@New = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.n.created_at
      React.DOM.td null, @props.n.title
      React.DOM.td null, @props.n.website
      React.DOM.td null,
        React.DOM.a
          className: 'btn'
          'Delete'
