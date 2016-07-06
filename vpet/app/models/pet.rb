class Pet < ActiveRecord::Base
  belongs_to :highscore
  belongs_to :user
  has_many :games, dependent: :destroy
end
