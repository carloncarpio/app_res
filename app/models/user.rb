class User < ActiveRecord::Base

	has_many :vipbbsrsbb
	has_many :lbdd
	has_many :srsaavipaa
	has_many :srsaa
	has_many :srsa
	has_many :csaa
	has_many :csa
	has_many :lbcc
	has_many :vipasrsa
	has_many :srsbvipb
	has_many :lbbb
	has_many :lbaa
	has_many :lba

	def self.authenticate(username="",password="")
		user = User.find_by_username(username)
		if user && user.password == password
			user
		else
			false
		end
	end

end
