class Pet < ActiveRecord::Base
  belongs_to :highscore
  belongs_to :user
end
