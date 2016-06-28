class Image < ActiveRecord::Base
	belongs_to :user, through :imageuser
	has_many :imageuser
	has_many :tag
end
