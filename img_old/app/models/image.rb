class Image < ActiveRecord::Base
    has_many :user, through: :image_user, dependent: :destroy
	has_many :image_user, dependent: :destroy
	has_many :tag
end
