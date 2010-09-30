##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "uPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.1"
description ""
examples %w|
https://my.rice.edu/uPortal/
https://my.nsac.ca/uPortal/
https://my.uis.edu/uPortal/
https://my.ucmerced.edu/uPortal/
https://my.rutgers.edu/portal/
https://my.ubc.ca/
https://my.nau.edu/uPortal/
https://my.uga.edu/uPortal/
https://smgportal.bu.edu/uPortal/
https://saffron.ringling.edu/uPortal/
https://thefort.fortlewis.edu/uPortal/
|

matches [

# About 1,790 results @ 2010-06-13
{:name=>'GHDB: "powered by uportal"',
:certainty=>75,
:ghdb=>'"powered by uportal"'
}

]

# <a target="_blank" title="Powered by $" href="http://www.jasig.org/uportal">Powered by uPortal 3.1.1</a>
# <a target="_blank" title="Powered by $" href="http://www.uportal.org">Powered by uPortal 3.0.2 on UP6</a>
# <a target="_blank" title="Powered by $" href="http://www.uportal.org">Powered by uPortal 3.0.2</a>
# <a target="_blank" title="Powered by $" href="http://www.uportal.org">Powered by uPortal 3.0.1</a>
# <img src="rsad_channels/images/poweredByUPortal.png" class="clearPNGimage" alt="Powered by uPortal 1.0" border=0 width=121 height=11>&nbsp; &nbsp;
def passive
        m=[]

        if @body =~ /<a target="_blank" title="Powered by \$" href="http:\/\/www.uportal.org">Powered by uPortal [0-9a-zA-Z\ \.\-_]+<\/a>/
                        v=@body.scan(/<a target="_blank" title="Powered by \$" href="http:\/\/www.uportal.org">Powered by uPortal ([0-9a-zA-Z\ \.\-_]+)<\/a>/)[0][0]
                        m << {:name=>"powered by text", :version=>v }
        end

	if @meta["uportal-version"] =~ /uPortal_rel-([\-0-9]+)/i
		v=@meta["uportal-version"].scan(/uPortal_rel-([\-0-9]+)/i)[0][0]
		m << {:name=>"uportal-version header",  :version=>v }
	end

	if @body =~ /<img [a-zA-Z0-9\s\.\-\+\=\"\'\\\/_]*alt="Powered by uPortal [\d\.]+"[a-zA-Z0-9\s\.\-\+\=\"\'\\\/_]*>/
		v=@body.scan(/<img [a-zA-Z0-9\s\.\-\+\=\"\'\\\/_]*alt="Powered by uPortal ([\d\.]+)"[a-zA-Z0-9\s\.\-\+\=\"\'\\\/_]*>/)[0][0]
		m << {:name=>"old powered by text", :version=>v }
	end

        m

end


end

