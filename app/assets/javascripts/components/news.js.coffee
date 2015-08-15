@News = React.createClass
  getInitialState: ->
    news: @props.data
  getDefaultProps: ->
    news: []
  render: ->
    React.DOM.div
      className: 'news'
      React.DOM.h2
        className: 'title'
        'News'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Amount'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for n in @state.news
            React.createElement New, key: n.id, n: n
