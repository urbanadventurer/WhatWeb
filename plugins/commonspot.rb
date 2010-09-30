##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CommonSpot" do
author "Tonmoy Saikia"
version "0.1"
description "CommonSpot is CMS. Site-http://www.paperthin.com/"
examples %w|
http://www.scu.edu/
http://www.orlandoinfo.com/
http://www.nist.gov/index.html
http://www.ohio.edu/bicentennial/
http://www.ohio.edu/
http://www3.sanmita.com/
http://www.engineering.cornell.edu/
http://alumni.library.cornell.edu/
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

#<meta name="Generator" id="Generator" content="CommonSpot Content Server Build 5.0.2.56" />
#<img src="/commonspot/images/menu-pagegallery.gif" border="0" width="16" height="12" alt="" />
#<link rel="stylesheet" href="/commonspot/commonspot.css" type="text/css" id="cs_maincss" /> 
matches [
{:name=>"Generator",
 :regexp=>/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^"]+"[^>]*\/>/ }, #"

{:name=>"img tags",
 :regexp=>/<img[^>]+src="[^"]+commonspot[^"]+"[^>]*\/>/
},

{:name=>"commonspot.css",
 :regexp=>/<link[^>]+href="[^"]commonspot\/commonspot\.css"[^>]+\/>/ #"
}

]


def passive
        m=[]
		
	if @body =~/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^\d]+([\d\.]+)/
                version=@body.scan(/<meta[^>]+name="Generator"[^>]+content="CommonSpot[^\d]+([\d\.]+)/)
                m << {:name=>"meta generator",:version=>version}
        end
        m
end


end
