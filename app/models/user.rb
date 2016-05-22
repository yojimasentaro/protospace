class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise    :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
  has_many  :prototypes
  validates :username,      presence: true
  validates :password,   length: { minimum: 8 }
  validates :email,      presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
