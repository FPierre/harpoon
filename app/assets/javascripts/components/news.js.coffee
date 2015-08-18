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
    React.DOM.ul
      className: 'news collection'
      for n in @state.news
        React.createElement New, key: n.id, n: n, handleDeleteNew: @deleteNew
