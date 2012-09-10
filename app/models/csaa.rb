class Csaa < ActiveRecord::Base

	belongs_to :user

	def self.find_section(section="")
		section = Csaa.where(:section => section)
	end

	def self.find_reserve(company="")
		reserve = Csaa.where(:company_name => company)
	end

	def self.total_approved(approved)
		approved_seat = Csaa.where(:approved => approved)
	end

	def self.total_pending(approved,status)
		approved_seat = Csaa.where(:approved => approved, :status => status)
	end
	
end
