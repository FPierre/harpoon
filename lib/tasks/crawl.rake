require 'mechanize'

namespace :crawler do
  desc "Fetch websites and get news"
  task run: :environment do
    puts 'rake crawler:run'
    # http://www.justinweiss.com/blog/2014/08/25/the-lesser-known-features-in-rails-4-dot-2/
    config  = Rails.application.config_for(:crawler)
    crawler = Crawler.new(config['websites'], config['tags'])

    crawler.get_articles.each do |category, article|
      unless Article.exists?(title: article[:text], url: article[:url])
        Article.create(title: article[:text], url: article[:url], tag: article[:tag], website: article[:website][0], category: category)
      end
    end
  end

  desc "Fetch websites and get news"
  task run2: :environment do
    puts 'rake crawler:run2'
    config  = Rails.application.config_for(:crawler)

    mechanize = Mechanize.new
    page = mechanize.get('https://news.ycombinator.com/newest')
    links = page.root.css('#hnmain table a[href^="http"]')

    links = links.reject{ |l| l['href'] =~ /^http/ }

    # links.each do |l|
    #   puts l['href']
    # end
  end
end
