class Image < ActiveRecord::Base
  belongs_to :user

  has_many :users, through: :image_users
  has_many :image_users, through: :user, dependent: :destroy
  has_many :tags, dependent: :destroy

  def generate_filename
    @string ||=  SecureRandom.hex(8)
  end
end
