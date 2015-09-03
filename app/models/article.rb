class Article < ActiveRecord::Base
  scope :category, -> (category) { where(category: category) }
  scope :tag, -> (tag) { where(tag: tag) }

  after_commit{ ArticleRelayJob.perform_later(self) }

  def self.percent_categories
    config  = Rails.application.config_for(:crawler)
    percent = Array.new

    config['categories'].keys.each{ |c| percent << { label: c, value: Article.category(c).size, color: '#CCC' }}
    percent
  end
end
