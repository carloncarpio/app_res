class Csa < ActiveRecord::Base

	belongs_to :user

	def self.find_section(section="")
		section = Csa.where(:section => section)
	end

	def self.find_reserve(company="")
		reserve = Csa.where(:company_name => company)
	end

	def self.total_approved(approved)
		approved_seat = Csa.where(:approved => approved)
	end

	def self.total_pending(approved,status)
		approved_seat = Csa.where(:approved => approved, :status => status)
	end

end
