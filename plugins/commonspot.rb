##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-17 # Brendan Coles <bcoles@gmail.com>
# Updated version detection
##
Plugin.define "CommonSpot" do
author "Tonmoy Saikia"
version "0.2"
description "The CommonSpot Web content management solution (Web CMS) increases the value of content by creating engaging Web experiences that generate high impact results. - Homepage: http://www.paperthin.com/"

# Examples #
examples %w|
http://www.scu.edu/
http://www.orlandoinfo.com/
http://www.nist.gov/index.html
http://www.ohio.edu/bicentennial/
http://www.ohio.edu/
http://www3.sanmita.com/
http://www.engineering.cornell.edu/
http://www.orie.cornell.edu/
http://www.iccd.cornell.edu/
http://www.uwrf.edu/
http://foryourvocation.org/
http://www.kent.edu/
http://www.hasbro.com/
http://www.scisys.com/
http://www5.gmsproject.org/
http://www.american.edu/
http://www.esabna.com/
http://www.riversideonline.com/
http://tulane.edu/
|

# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^"]+"[^>]*\/>/ },

# img tags
{ :regexp=>/<img[^>]+src="[^"]+commonspot[^"]+"[^>]*\/>/ },

# commonspot.css
{ :regexp=>/<link[^>]+href="[^"]commonspot\/commonspot\.css"[^>]+\/>/ },

# Version Detection # Meta Generator
{ :version=>/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^\d^"]+([\d\.]+)"[^>]*\/>/ },

]

end

