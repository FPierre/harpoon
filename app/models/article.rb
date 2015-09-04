class Article < ActiveRecord::Base
  scope :category, ->(category) { where(category: category) }
  scope :tag, ->(tag) { where(tag: tag) }

  after_commit{ ArticleRelayJob.perform_later(self) }

  def self.day(day)
    day = day.capitalize.to_s if day.is_a? Symbol

    Article.all.select{ |article| article.created_at.strftime("%A") == day }
  end

  def self.hour(start, stop)
    Article.all.select{ |article| article.created_at.hour.between?(start, stop) }
  end

  def self.percent_categories
    config = Rails.application.config_for(:crawler)
    data   = Array.new

    config['categories'].keys.each{ |c| data << { label: c, value: Article.category(c).size, color: '#CCC' }}
    data
  end

  def self.percent_categories_days
    config = Rails.application.config_for(:crawler)
    data   = Hash.new

    data[:labels]   = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    data[:datasets] = Array.new

    config['categories'].keys.each do |category|
      articles_days = Array.new

      data[:labels].each{ |day| articles_days << Article.day(day).size }

      data[:datasets] << {
        data:                 articles_days,
        label:                category,
        fillColor:            "rgba(220,220,220,0.2)",
        pointColor:           "rgba(220,220,220,1)",
        strokeColor:          "rgba(220,220,220,1)",
        pointStrokeColor:     "#fff",
        pointHighlightFill:   "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)"
      }
    end

    data
  end

  def self.percent_categories_websites
    config = Rails.application.config_for(:crawler)
    data   = Hash.new

    data[:labels]   = ['00-04', '04-08', '08-12', '12-14', '14-16', '16-18', '18-20', '20-22', '22-00']
    data[:datasets] = Array.new

    config['categories'].keys.each do |category|
      articles_hours = Array.new

      [[0, 4],  [4, 8],   [8, 12],
      [12, 14], [14, 16], [16, 18],
      [18, 20], [20, 22], [22, 00]].each{ |hour| articles_hours << Article.hour(hour[0], hour[1]).size }

      data[:datasets] << {
        data:                 articles_hours,
        label:                category,
        fillColor:            "rgba(220,220,220,0.2)",
        pointColor:           "rgba(220,220,220,1)",
        strokeColor:          "rgba(220,220,220,1)",
        pointStrokeColor:     "#fff",
        pointHighlightFill:   "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)"
      }
    end

    data
  end
end
