class Website < ActiveRecord::Base
  has_many :articles

  validates :name, presence: true,
                   uniqueness: true,
                   format: { with: /\A[\S]+\z/ },
                   length: {
                     in: 3..30,
                     too_short: "must have at least %{count} words",
                     too_long: "must have at most %{count} words"
                   }
  validates :url, presence: true,
                  uniqueness: true,
                  format: { with: /\A(http|https):\/\/[\S]+\z/ },
                  length: {
                    in: 10..255,
                    too_short: "must have at least %{count} words",
                    too_long: "must have at most %{count} words"
                  }
end
