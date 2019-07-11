class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
end
