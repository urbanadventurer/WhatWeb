#
# Version 0.2 # 2016-08-19 # Bhavin Senjaliya <bhavin.senjaliya@gmail.com>
# Add cookies
#
##
Plugin.define do
name "DemandWare eCommerce System"
authors [
  "Claudio Salazar <csalazar at spect dot cl>",
]
version "0.2"
description "Digital commerce for the changing face of retail."
website "https://www.demandware.com/"

matches [

	{:regexp=>/\/demandware.store\//, :certainty => 25 },

	# Cookie 
	{ :search => "headers[set-cookie]", :regexp => /cqcid/, :name=>"cqcid cookie" },
	{ :search => "headers[set-cookie]", :regexp => /dwac_/, :name=>"dwac_ cookie" },
	{ :search => "headers[set-cookie]", :regexp => /dwac_/, :name=>"dwac_ cookie" },
	{ :search => "headers[set-cookie]", :regexp => /dwsid/, :name=>"dwsid cookie" },
	
]

end