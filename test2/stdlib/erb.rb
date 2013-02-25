require 'erb'

treehouse = {
	:name => 'treehouse',
	:location => 'Somewhere'
}

template = <<-TEMPLATE 
	
	From the desk of <%= treehouse[:name] %>
	-----------------------------------------
	Welcome to <%= treehouse[:location] %>,

	we hope  yo enjoy your stay

	-----------------------------------------
	<% treehouse.keys.each do |key| %>
		Key: <%=key%>
	<% end %>
TEMPLATE


erb = ERB.new(template)
puts erb.result