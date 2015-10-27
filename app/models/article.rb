class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :website

  validates :title, presence: true,
                    length: {
                      in: 5..255,
                      too_short: "must have at least %{count} words",
                      too_long: "must have at most %{count} words"
                    }
  validates :url, presence: true,
                  length: {
                    in: 10..255,
                    too_short: "must have at least %{count} words",
                    too_long: "must have at most %{count} words"
                  }


  after_commit{ ArticleRelayJob.perform_later(self) }

  scope :by_category, ->(category){ where(category: category) }
  scope :by_tag, ->(tag){ where(tag: tag) }
  scope :by_website, ->(website){ where(website: website) }

  # TODO Le passer en scope ?
  def self.by_day day
    day = day.capitalize.to_s if day.is_a? Symbol

    Article.all.select{ |article| article.created_at.strftime("%A") == day }
  end

  # TODO Le passer en scope ?
  def self.by_hour start, stop
    Article.all.select{ |article| article.created_at.hour.between?(start, stop) }
  end

  def self.percent_categories
    config = Rails.application.config_for :crawler
    config['categories'].keys.inject([]){ |a, category| a << { label: category, value: Article.by_category(category).size }; a }
  end

  def self.percent_categories_days
    config = Rails.application.config_for(:crawler)
    data   = Hash.new

    data[:labels]   = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    data[:datasets] = Array.new

    config['categories'].keys.each do |category|
      articles_days = Array.new
      color = Article.random_color

      data[:labels].each{ |day| articles_days << Article.by_category(category).by_day(day).size }

      data[:datasets] << Hash[
        data:                 articles_days,
        label:                category,
        fillColor:            "rgba(#{color[:rgb]}, 0.2)",
        pointColor:           "rgba(#{color[:rgb]}, 1)",
        strokeColor:          "rgba(#{color[:rgb]}, 1)",
        pointStrokeColor:     color[:hex],
        pointHighlightFill:   color[:hex],
        pointHighlightStroke: "rgba(#{color[:rgb]}, 1)"
      ]
    end

    data
  end

  def self.percent_categories_hours
    config = Rails.application.config_for(:crawler)
    data   = Hash.new

    data[:labels]   = ['0am-4am', '4am-8am', '8am-12am', '12pm-2pm', '2pm-4pm', '4pm-6pm', '6pm-8pm', '8pm-10pm', '10pm-12pm']
    data[:datasets] = Array.new

    config['categories'].keys.each do |category|
      articles_hours = Array.new
      color = Article.random_color

      [[0, 4],  [4, 8],   [8, 12],
      [12, 14], [14, 16], [16, 18],
      [18, 20], [20, 22], [22, 00]].each{ |hour| articles_hours << Article.by_category(category).by_hour(hour[0], hour[1]).size }

      data[:datasets] << Hash[
        data:                 articles_hours,
        label:                category,
        fillColor:            "rgba(#{color[:rgb]}, 0.2)",
        pointColor:           "rgba(#{color[:rgb]}, 1)",
        strokeColor:          "rgba(#{color[:rgb]}, 1)",
        pointStrokeColor:      color[:hex],
        pointHighlightFill:    color[:hex],
        pointHighlightStroke: "rgba(#{color[:rgb]}, 1)"
      ]
    end

    data
  end

  def self.percent_categories_websites

  end

  def self.random_color
    [
      { hex: '#ef9a9a', rgb: '239, 154, 154' },
      { hex: '#f48fb1', rgb: '244, 143, 177' },
      { hex: '#ce93d8', rgb: '206, 147, 216' },
      { hex: '#b39ddb', rgb: '179, 157, 219' },
      { hex: '#9fa8da', rgb: '159, 168, 218' },
      { hex: '#90caf9', rgb: '144, 202, 249' },
      { hex: '#81d4fa', rgb: '129, 212, 250' },
      { hex: '#80deea', rgb: '129, 212, 250' },
      { hex: '#80cbc4', rgb: '128, 203, 196' },
      { hex: '#a5d6a7', rgb: '165, 214, 167' },
      { hex: '#c5e1a5', rgb: '197, 225, 165' },
      { hex: '#e6ee9c', rgb: '230, 238, 156' },
      { hex: '#fff59d', rgb: '255, 245, 157' },
      { hex: '#ffe082', rgb: '255, 224, 130' },
      { hex: '#ffcc80', rgb: '255, 204, 128' },
      { hex: '#ffab91', rgb: '255, 171, 145' },
      { hex: '#bcaaa4', rgb: '188, 170, 164' },
      { hex: '#eeeeee', rgb: '238, 238, 238' },
      { hex: '#b0bec5', rgb: '176, 190, 197' }
    ].sample
  end
end
