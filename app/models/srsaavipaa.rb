class Srsaavipaa < ActiveRecord::Base

	belongs_to :user

	def self.find_section(section="")
		section = Srsaavipaa.where(:section => section)
	end

	def self.find_reserve(company="")
		reserve = Srsaavipaa.where(:company_name => company)
	end

	def self.total_approved(approved)
		approved_seat = Srsaavipaa.where(:approved => approved)
	end

	def self.total_pending(approved,status)
		approved_seat = Srsaavipaa.where(:approved => approved, :status => status)
	end


end
