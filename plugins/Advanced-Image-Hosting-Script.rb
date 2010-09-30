##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Advanced-Image-Hosting-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "AIHS is a highly-flexible advanced image hosting solution for anyone who wants to offer an image hosting services of any kind. - homepage: http://yabsoft.com/aihs-feature.php"

# 2 results for "Welcome to install Advanced Image Hosting Script" @ 2010-08-30
# 1 result for "Powered by Advanced Image Hosting Script" @ 2010-08-30
examples %w|
yabsoft.info/demo/aihs/
yabsoft.info/demo/aihs/admin/
yabsoft.info/demo/aihspro/
yabsoft.info/demo/aihspro/admin/login.php?admin=
hostyourpix.com/admin/login.php?admin=
hostyourpix.com/install/
phoqlove.com/install/
|

matches [

# Admin page CSS
{ :text=>'  .title                          { font-size: 10px; font-weight: bold; line-height: 150%; color: #FFFFFF; height: 26px; background-image: url(./tile_back.gif) }' },

# Admin page h3 title text
{ :text=>'    <td colspan=2 align=center><h3>Advanced Image Host Script</h3></td>' },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /Powered by: <B><a href="http:\/\/yabsoft.com">AIH v([\d\.]+)<\/a><\/B>/
                version=@body.scan(/Powered by: <B><a href="http:\/\/yabsoft.com">AIH v([\d\.]+)<\/a><\/B>/)[0][0]
                m << {:version=>version}
        end

	# Install page
	if @body =~ /<center><b>Welcome to install AIHS Script ([\d\.]+)<\/b><\/center>/
		version=@body.scan(/<center><b>Welcome to install AIHS Script ([\d\.]+)<\/b><\/center>/)[0][0]
		m << {:version=>version}
	end
	if @body =~ /<tr><td class=info width=100%>Welcome to install Advanced Image Hosting Script Pro ([\d\.]+) on your server<\/td><\/tr>/
		version@body.scan(/<tr><td class=info width=100%>Welcome to install Advanced Image Hosting Script Pro ([\d\.]+) on your server<\/td><\/tr>/)[0][0]
		 m << {:version=>version}
	end

        m

end


end

