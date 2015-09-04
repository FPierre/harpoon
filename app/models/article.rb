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

    config['categories'].keys.each{ |category| data << { label: category, value: Article.category(category).size, color: Article.random_color[:hex] }}

    data
  end

  def self.percent_categories_days
    config = Rails.application.config_for(:crawler)
    data   = Hash.new

    data[:labels]   = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    data[:datasets] = Array.new

    config['categories'].keys.each do |category|
      articles_days = Array.new
      color = Article.random_color

      data[:labels].each{ |day| articles_days << Article.day(day).size }

      data[:datasets] << {
        data:                 articles_days,
        label:                category,
        fillColor:            "rgba(#{color[:rgb]}, 0.2)",
        pointColor:           "rgba(#{color[:rgb]}, 1)",
        strokeColor:          "rgba(#{color[:rgb]}, 1)",
        pointStrokeColor:     color[:hex],
        pointHighlightFill:   color[:hex],
        pointHighlightStroke: "rgba(#{color[:rgb]}, 1)"
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
      color = Article.random_color

      [[0, 4],  [4, 8],   [8, 12],
      [12, 14], [14, 16], [16, 18],
      [18, 20], [20, 22], [22, 00]].each{ |hour| articles_hours << Article.hour(hour[0], hour[1]).size }

      data[:datasets] << {
        data:                 articles_hours,
        label:                category,
        fillColor:            "rgba(#{color[:rgb]}, 0.2)",
        pointColor:           "rgba(#{color[:rgb]}, 1)",
        strokeColor:          "rgba(#{color[:rgb]}, 1)",
        pointStrokeColor:      color[:hex],
        pointHighlightFill:    color[:hex],
        pointHighlightStroke: "rgba(#{color[:rgb]}, 1)"
      }
    end

    data
  end

  def self.random_color
    [
      { hex: '#ffebee', rgb: '255, 235, 238' },
      { hex: '#ffcdd2', rgb: '255, 205, 210' },
      { hex: '#ef9a9a', rgb: '239, 154, 154' },
      { hex: '#e57373', rgb: '229, 115, 115' },
      { hex: '#ef5350', rgb: '239, 83, 80' },
      { hex: '#fce4ec', rgb: '252, 228, 236' },
      { hex: '#f8bbd0', rgb: '248, 187, 208' },
      { hex: '#f48fb1', rgb: '244, 143, 177' },
      { hex: '#f06292', rgb: '240, 98, 146' },
      { hex: '#ec407a', rgb: '236, 64, 122' }
    ].sample
  end
end
