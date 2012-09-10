class Lbd < ActiveRecord::Base

	belongs_to :user

	def self.find_section(section="")
		section = Lbd.where(:section => section)
	end

	def self.find_reserve(company="")
		reserve = Lbd.where(:company_name => company)
	end

	def self.total_approved(approved)
		approved_seat = Lbd.where(:approved => approved)
	end

	def self.total_pending(approved,status)
		approved_seat = Lbd.where(:approved => approved, :status => status)
	end

	
end
