##
Plugin.define do
name "Open Commerce Platform"
authors [
  "Claudio Salazar <csalazar at spect dot cl>",
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
]
version "0.2"
description "Open Commerce Platform™ (OCP) is the industry-leading direct commerce platform for business-to-consumer, business-to-business, mobile, order management, and call center commerce solutions."
website "http://www.micros-fidelio.eu/en/Solutions/Products-N-Z/OCP-Open-Commerce-Platform.aspx"

matches [
	{:regexp=>/\/js\/ocpsdk\/base.js/ }
]

end