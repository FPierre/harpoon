# Example : http://www.richardhsu.me/posts/2015/04/02/rails-4-custom-configurations.html

# Scrapper::Application.config.x.refresh_rate = :daily

Rails.application.config.after_initialize do
  # http://www.justinweiss.com/blog/2014/08/25/the-lesser-known-features-in-rails-4-dot-2/
  config  = Rails.application.config_for(:crawler)
  crawler = Crawler.new(config['websites'], config['tags'])

  articles = crawler.get_articles

  articles.each do |category, article|
    unless Article.exists?(title: article[:text], url: article[:url])
      Article.create(title: article[:text], url: article[:url], tag: article[:tag], website: article[:website][0], category: category)
    end
  end
end
