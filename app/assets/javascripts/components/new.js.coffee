@New = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/news/#{@props.n.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteNew @props.n
  render: ->
    React.DOM.li
      className: 'collection-item'
      React.DOM.a
        href: @props.n.url
        React.DOM.span
          @props.n.category
        React.DOM.span
          @props.n.title
        React.DOM.span
          @props.n.created_at
        React.DOM.span
          @props.n.website
