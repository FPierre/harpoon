class Article < ActiveRecord::Base
  scope :category, ->(category) { where(category: category) }
  scope :tag, ->(tag) { where(tag: tag) }

  after_commit{ ArticleRelayJob.perform_later(self) }
end
