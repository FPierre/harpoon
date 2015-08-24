class Article < ActiveRecord::Base
  after_commit{ ArticleRelayJob.perform_later(self) }
end
