class Lbdd < ActiveRecord::Base

	belongs_to :user

	def self.find_section(section="")
		section = Lbdd.where(:section => section)
	end

	def self.find_reserve(company="")
		reserve = Lbdd.where(:company_name => company)
	end

end
