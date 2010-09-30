##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Realtor-747" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "IT747.COM is proudly presenting a property listings management system REALTOR 747 for real estate agents which adopted template based design so that web site designers can fully express their own imagination. - homepage: http://www.it747.com/realtor747/"

# 10 results for "powered by Realtor 747" @ 2010-08-27
examples %w|
www.it747.com/realtor747/demo/admin_demo/admin/index.php
webdesign.jejusoft.com/demo/admin_demo/admin/index.php
louisvillehighlights.com/admin/index.php
|

matches [

# Admin page
{ :text=>'<body onload="start_realtor747_admin();" onunload="stop_realtor747_admin();">' },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /    <a href="http:\/\/www.it747.com\/realtor747" target="_blank"><span style="color: green;">Powered by REALTOR 747 - The Property Listings Management System - Version ([\d\.]+)<\/span><\/a><br>/
                version=@body.scan(/    <a href="http:\/\/www.it747.com\/realtor747" target="_blank"><span style="color: green;">Powered by REALTOR 747 - The Property Listings Management System - Version ([\d\.]+)<\/span><\/a><br>/)[0][0]
                m << {:version=>version}
        end

	# Admin title
	if @body =~ /<title>REALTOR 747 - The Property Listings Management System - Administration  - Version ([\d\.]+)<\/title>/
		version=@body.scan(/<title>REALTOR 747 - The Property Listings Management System - Administration  - Version ([\d\.]+)<\/title>/)[0][0]
		m << {:version=>version}
	end

        m

end


end

