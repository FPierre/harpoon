class ImportWebsite < ActiveRecord::Migration
  def change
    websites = [
      { name: 'hackernews', url: 'https://news.ycombinator.com/newest' },
      { name: 'rubyflow', url: 'http://www.rubyflow.com' },
      { name: 'humancoders', url: 'http://news.humancoders.com/items/newest' }
    ]

    Website.create! websites
  end
end
