class User < ActiveRecord::Base
  has_many :habits
  has_secure_password

end
