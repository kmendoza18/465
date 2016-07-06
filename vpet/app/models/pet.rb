class Pet < ActiveRecord::Base
  belongs_to :highscore
  belongs_to :user
  has_many :games, dependent: :destroy

    def self.decrement
        @pet.health -= 1
    end
end
