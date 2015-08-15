@News = React.createClass
  getInitialState: ->
    news: @props.data
  getDefaultProps: ->
    news: []
  deleteNew: (n) ->
    news = @state.news.slice()
    index = news.indexOf n
    news.splice index, 1
    @replaceState news: news
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
            React.DOM.th null, 'Created date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Website'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for n in @state.news
            React.createElement New, key: n.id, n: n, handleDeleteNew: @deleteNew
