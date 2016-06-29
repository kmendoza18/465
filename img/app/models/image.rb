class Image < ActiveRecord::Base
  belongs_to :user
  has_many :image_users, through: :user, dependent: :destroy
  has_many :tag

  def generate_filename
    return (0...8).map { (65 + rand(26)).chr }.join
  end
end
