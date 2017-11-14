class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 4 }

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return self
    else
      return nil
    end
  end
end
