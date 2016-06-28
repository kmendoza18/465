class User < ActiveRecord::Base
	has_many :image
	has_many :imageuser
end
