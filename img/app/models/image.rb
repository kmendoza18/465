class Image < ActiveRecord::Base
    has_many :user, through: :imageuser, dependent: :destroy
	has_many :imageuser, dependent: :destroy
	has_many :tag
end
