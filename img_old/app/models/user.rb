class User < ActiveRecord::Base
	has_many :images, dependent: :destroy
	has_many :image_users, dependent: :destroy
end
