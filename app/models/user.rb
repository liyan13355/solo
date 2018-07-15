
class User < ApplicationRecord
	has_secure_password
	enum role:[:user, :superadmin]
	validates :email, uniqueness: true, presence: true

end
