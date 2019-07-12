class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  before_save :sanitize_name

  def sanitize_name
    self.name = self.name.titleize
  end
end
