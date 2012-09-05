class User < ActiveRecord::Base

	has_many :vipbbsrsbb
	has_many :lbdd

	def self.authenticate(username="",password="")
		user = User.find_by_username(username)
		if user && user.password == password
			user
		else
			false
		end
	end

end
