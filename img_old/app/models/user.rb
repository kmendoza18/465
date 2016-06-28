class User < ActiveRecord::Base
	has_many :image, dependent: :destroy
	has_many :imageuser, dependent: :destroy
end
