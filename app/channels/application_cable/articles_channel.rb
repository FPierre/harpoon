class ArticlesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'articles'
  end

#   def follow(data)
#     stop_all_streams
#     stream_from 'articles'
#   end

#   def unfollow
#     stop_all_streams
#   end
end
