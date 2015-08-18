@Category = React.createClass
  render: ->
    React.DOM.a
      className: 'collection-item blue-grey lighten-3 blue-grey-text text-darken-3'
      href: ''
      @props.c
      React.DOM.span
        className: 'new badge'
        1
