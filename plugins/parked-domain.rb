##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-06 #
# Added matches for multiple hosts
##
Plugin.define "Parked-Domain" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.2"
description "This plugin recognises web pages for common web hosts who allow domain parking."



# Matches #
matches [

# GoDaddy.com
{ :text=>'<img src="http://images-pw.secureserver.net/images/log_gd_3.gif" usemap="#lmap" border="0" alt="This web page is parked FREE, courtesy of GoDaddy.com" ></a></div>', :string=>'GoDaddy.com' },
{ :text=>"<script language='javascript' src='https://a12.alphagodaddy.com/hosting_ads/gd01.js'></script>", :string=>'GoDaddy.com' },

# Servlet.com
{ :text=>'<title>This Domain is Parked at Servlet.com</title>', :string=>'Servlet.com' },
{ :text=>"document.write('<a href=\"mailto:info' + '@' + 'servlet.com\">' + 'contact us</a>');", :string=>"Servlet.com" },

# Dreamhost.com
{ :text=>'<title>Domain Temporarily Parked with Dreamhost.com!</title>', :string=>'Dreamhost.com' },

# eHost.co.za
{ :text=>'<title>This domain is parked with eHost.co.za</title>', :string=>"eHost.co.za" },

# WebOlli.com
{ :text=>'<title>This domain is currently parked at WebOlli Hosting Solutions - www.WebOlli.com</title>', :string=>"WebOlli.com" },

# Sitelutions.com
{ :text=>'<div class="parkblurb">This domain is parked for free at Sitelutions.  The domain name <b>', :string=>'Sitelutions.com' },

# Domainmasters.co.ke
{ :text=>"<title>This Domain is Parked at Domainmasters.co.ke</title>", :string=>"Domainmasters.co.ke" },

# The Good Geeks.com
{ :text=>'<title>This domain is parked by The Good Geeks / Geek Media</title>', :string=>'The Good Geeks.com' },

# IberSoluciones.com
{ :text=>'<title>This domain is parked by IberSoluciones.com</title>', :string=>'IberSoluciones.com' },

# Enlighten Hosting.com
{ :text=>'<title>Enlighten Hosting - This domain is currently parked</title>', :string=>'Enlighten Hosting.com' },
{ :text=>'<a href="http://www.enlightenhosting.com/services/domain/freeparking.aspx">Parking your domain</a> is a free service provided by <a href="http://www.enlightenhosting.com/">Enlighten Hosting</a>.</p>', :string=>'Enlighten Hosting.com' },

# Omega Point Design.com
{ :text=>'<img src="http://www.omegapointdesign.com/domain_parked.jpg" alt="This domain is parked" border="0" /></div>', :string=>'Omega Point Design.com' },

# config.com
{ :text=>'<TITLE>This domain is parked at config.com Internet services provider - commercial and consumer Internet services </TITLE>', :string=>'config.com' },

# Dot Com Today.com
{ :text=>'<title>This Domain is Parked at Dot Com Today</title>', :string=>'Dot Com Today.com' },

# Web.com
{ :text=>'<title>This domain is parked for free with web.com</title>', :string=>'Web.com' },

]

end

