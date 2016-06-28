class Image < ActiveRecord::Base
	belongs_to :user, dependent: :destroy #, through :imageuser
	has_many :imageuser, dependent: :destroy
	has_many :tag
end
