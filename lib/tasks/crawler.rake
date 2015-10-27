require 'mechanize'

namespace :crawler do
  desc 'Fetch websites and get articles'
  task run: :environment do
    puts 'rake crawler:run'

    crawler = Crawler.new

    crawler.find_articles.each do |article|
      Article.create(article) unless Article.exist? url: article[:url]
    end
  end

  desc 'Fetch websites and get news'
  task run2: :environment do
    puts 'rake crawler:run2'
    config  = Rails.application.config_for(:crawler)

    mechanize = Mechanize.new
    page = mechanize.get 'https://news.ycombinator.com/newest'
    links = page.root.css '#hnmain table a[href^="http"]'

    links = links.reject{ |l| l['href'] =~ /^http/ }

    # links.each do |l|
    #   puts l['href']
    # end
  end
end
