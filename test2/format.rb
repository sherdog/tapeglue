module FormatAttributes
	def formats(*attributes)
		@format_attributes = attributes
	end

	def format_attributes
		@format_attributes
	end

end


module Formatter
	def display
		self.class.format_attributes.each do |attribute|
			puts "[#{attribute.to_s.upcase}] #{send(attribute)}"
		end
	end
end

class Resume
	extend FormatAttributes
	include Formatter
	attr_accessor :name, :phone_number, :email, :experience
	formats :name, :phone_number, :email, :experience
end



resume = Resume.new
resume.name = "Mike Sheridan"
resume.email = "Mikes@pipac.com"
resume.phone_number = "3192687139"
resume.experience = "10+ Years"

resume.display