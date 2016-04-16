##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-Siebel-CRM" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-01
version "0.1"
description "The world's most complete customer relationship management (CRM) solution, Oracle's Siebel CRM helps organizations differentiate their businesses to achieve maximum top-and bottom-line growth. It delivers a combination of transactional, analytical, and engagement features to manage all customer-facing operations."
website "http://www.oracle.com/us/products/applications/siebel/index.html"

# 3 ShodanHQ results for Set-Cookie: BIGipServerSIEBEL
# 8 ShodanHQ results for start.swe
# 138 Google results for filetype:swe inurl:start

# Dorks #
dorks [
'filetype:swe inurl:start'
]



matches [

# Default Shortcut Icon
{ :md5=>"a28ebcac852795fe30d8e99a23d377c1", :url=>"/favicon.ico", :string=>"eService" },

# Frameset # Default HTML tag
{ :text=>"<html OT='SiebWebMainWindow'>" },

# Landing page # JavaScript message
{ :text=>"<p>Scripting is used to manage data interactions between the Siebel server/Web Server and the User Interface. This requires JavaScript to be enabled  in the web browser </p>" },

# Error page
{ :text=>'<body>The server you are trying to access is either busy or experiencing difficulties. Please close the Web browser, open a new browser window, and try logging in again.', :string=>"Temporarily Unavailable" },

# Landing page # Default JavaScript
{ :text=>'alert("Your session timed out because you were idle for too long.  Please log in again to resume.\nIf you had a Siebel attachment open, your changes may have been lost.  Please save the file locally, close it, and reattach it to the appropriate record.");' },
{ :text=>'<script language="javascript">top._swescript = window;</script>' },

# Login page # Default HTML comment
{ :text=>'<!-- SWELogin.swt  -->' },

# Landing page # Body onload
{ :text=>"<body onLoad=\"GotoUrl('start.swe?SWECmd=Start')\">", :string=>"eService" },

# Landing Page # Default JavaScript
{ :text=>'</form><script language="javascript">var formObj = document.forms["RedirectForHost"];formObj.SWEHo.value=top.location.hostname;formObj.submit();</script></body></html>' },

]

# Passive #
def passive
	m=[]

	# Cookies
	m << { :name=>"BIGipServerSiebel_EService_Prod Cookie" } if @headers["set-cookie"] =~ /BIGipServerSiebel_EService_Prod=[\d\.]+;/
	m << { :name=>"BIGipServerSIEBEL Cookie" } if @headers["set-cookie"] =~ /BIGipServerSIEBEL-80=[\d\.]+;/
	m << { :name=>"_sn Cookie" } if @headers["set-cookie"] =~ /_sn=[a-zA-Z0-9]{43}_; Version=1; Path=\//

	# Landing page # Default form HTML
	m << { :string=>@body.scan(/<input type[\s]*=[\s]*['"]?hidden["']? name[\s]*=[\s]*['"]?SWEView['"]? value[\s]*=[^\(]+\(([^\)]*)\)/).flatten } if @body =~ /<input type[\s]*=[\s]*['"]?hidden["']? name[\s]*=[\s]*['"]?SWEView['"]? value[\s]*=[^\(]+\(([^\)]*)\)/

	m

end

end

