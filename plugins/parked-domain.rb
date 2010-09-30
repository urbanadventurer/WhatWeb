##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Parked-Domain" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "This plugin recognises web pages for common web hosts who allow domain parking."

# 403 results for "This web page is parked FREE, courtesy of GoDaddy.com" @ 2010-08-14
# 4 results for intitle:"This Domain is Parked at Servlet.com" @ 2010-08-14
examples %w|
www.race-walking.com
chi.chinajade.net
www.poweracrosstexas.com
www.speechcheck.com
survivingasthma.com
physics.webplasma.com
sexonada.com
awards.ntoxicated.com
ca.slake.org
www.metaltrussofindiana.com
www.cementkiln.com
|

matches [

# GoDaddy.com
{ :text=>'<img src="http://images-pw.secureserver.net/images/log_gd_3.gif" usemap="#lmap" border="0" alt="This web page is parked FREE, courtesy of GoDaddy.com" ></a></div>', :version=>'GoDaddy.com' },

# Servlet.com
{ :text=>'<title>This Domain is Parked at Servlet.com</title>', :version=>'Servlet.com' },
{ :text=>"document.write('<a href=\"mailto:info' + '@' + 'servlet.com\">' + 'contact us</a>');" },

]

end

