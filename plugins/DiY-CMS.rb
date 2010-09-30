##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DiY-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "Do It Yourslef Content Management System is a feature-rich, php-built, mysql-based, opensource and free CMS. - homepage: http://www.diy-cms.com/"

# 41 results for "powered by DiY-CMS" @ 2010-09-17
# 6 results for intitle:"DIY-CMS Database Error" @ 2010-09-17
examples %w|
www.diy-cms.com
www.diy-cms.com/demo/
www.diy-cms.com/demo/admin/
arredoesterno.bricoliamo.com
xn--mgbaacbgb7d8hnafo5a0b.com
www.arabwriters.net/admin/
www.betna.net/radio/
www.bricoliamo.it
www.bricoliamo.org
www.egykora.eb2a.com
www.giardiniamo.com
www.postgresqlit.org
www.puponzi.com
www.rotellaro.com
|

matches [

# Powered by text
{ :text=>'Powered by: <a href="http://www.diy-cms.com" target="_blank">DIY-CMS</a>' },
{ :text=>'<a href="http://www.pghost.eu/14/18/diy_cms-25.html">Powered by DIY-CMS</a>' },

# Error page
{ :text=>'<title>DIY-CMS Database Error</title>' },
{ :text=>'<p><b><a href="http://www.diy-cms.com/" target="_blank">Powered by: DIY-CMS</a></b></p></body></html>' },

# Admin page
{ :text=>"<td valign='middle'><img border='0' src=\"admin_skin/default/images//admin_login.png\"></a></td>" },

]

# Version detection
def passive
        m=[]

	# Meta generator
        if @body =~ /<META content="Powered by DiY-CMS ([\d\.]+) [0-9]{4} " name="description">/
                version=@body.scan(/<META content="Powered by DiY-CMS ([\d\.]+) [0-9]{4} " name="description">/)[0][0]
                m << {:version=>version}
        end

	# Powered by text
	if @body =~ /Powered by <a href="http:\/\/www.pghost.eu[^>]+>DIY-CMS v ([\d\.]+)<\/a>/
		version=@body.scan(/Powered by <a href="http:\/\/www.pghost.eu[^>]+>DIY-CMS v ([\d\.]+)<\/a>/)[0][0]
		m << {:version=>version}
	end

        m

end


end

