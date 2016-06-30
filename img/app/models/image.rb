class Image < ActiveRecord::Base
  belongs_to :user

  has_many :users, through: :image_users
  has_many :image_users
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags

  def generate_filename
    self.filename = SecureRandom.hex(8)
  end

  def users_without_access
    # "-" performs array subtraction (A - B) ==> subtract B's elements from A
    # "- [self.user] removes the current user from the array
    #     must turn self.user into an array before it can be subtracted
    user_array = User.all - self.users - [self.user]

    # an array of all user's that don't have access

    # convert the array of users into the correct format 
    user_array.map { |user| [user.name + " (" + user.email + ")", user.id]}

    #[["Mr. Ardvark (a@a.com)", 1], ["Mr. Bear (b@b.com)", 2], ...]


  end
end
