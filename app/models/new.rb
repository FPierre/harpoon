class New < ActiveRecord::Base
  serialize :tags

  def self.test
    puts 'test'
  end
end
