class User < ActiveRecord::Base
  has_many :clases
  has_secure_password
  validates :email,    presence: true, uniqueness:  true
  validates :name,     presence: true
  validates :password, presence: true, length: { minimum: 6 }
  attr_accessor :remember_token


  def User.new_token
    SecureRandom.base64(100)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

end
