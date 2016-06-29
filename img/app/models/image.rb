class Image < ActiveRecord::Base
  belongs_to :user
  has_many :image_users, through: :user, dependent: :destroy
  has_many :tag
end
