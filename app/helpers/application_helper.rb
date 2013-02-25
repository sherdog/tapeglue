module ApplicationHelper
	def asset_url asset
	  "#{request.protocol}#{request.host_with_port}#{asset_path(asset)}"
	end

	def filetype_icon type
		
		case type
		when 'application/photoshop'
			return 'icon-adobe-photoshop-cs4-2.png'
		when 'application/dreamweaver'
			return 'icon-adobe-dreamweaver-cs4-2.png'
		when 'application/pdf'
			return 'icon-adobe-acrobat-cs4-2.png'
		else
			return 'icon-adobe-indesign-cs4-2.png'
		end
	end
end
