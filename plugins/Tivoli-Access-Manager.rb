##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tivoli-Access-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-05 #
version "0.1"
description "Tivoli Access Manager for e-business software is a highly scalable user authentication, authorization and Web SSO solution for enforcing security policies over a wide range of Web and application resources. It centralizes user access management for online portal and business initiatives. - Homepage: Homepage: http://www.ibm.com/software/tivoli/products/access-mgr-e-bus/"

# ShodanHQ results as at 2011-03-05 #
# 98 for realm Access Manager for e-business

# Google results as at 2011-03-05 #
# 35 for intitle:"Access Manager for e-business Login"

# Examples #
examples %w|
12.9.136.152
125.56.194.63
96.17.71.63
122.178.224.63
163.202.194.90
198.212.64.123
205.168.9.63
88.221.218.63
96.17.165.63
148.183.56.103
www.avnet-express.fi
avnet-express.hu
www.avnetexpress.fi
www.sinotrans.com
edge.avnet.com
mcs.modot.mo.gov/portal/wps/myportal/
go.dhs.lacounty.gov/wps/myportal
portal.cnh.com
www.firstdataeservices.com
team1.sos.state.tx.us/team/eRegistry/home.jsf
https://secure.miamidade.gov
https://ext02.montgomerycountymd.gov/
https://schools.dlssonline.com/index.asp
https://www.myvictaulic.com/
https://qkr.wr.com/projmgmt
https://login.dtcc.com/
https://internal.securit.biz/
https://www.finnair.fi/myidtravel
|

# Matches #
matches [

# Default Title
{ :text=>'<TITLE>Access Manager for e-business Login</TITLE>' },

# Default Copyright HTML Comment
{ :text=>'<!-- Copyright (C) 2000 Tivoli Systems, Inc. -->' },

# Default HTML Comment
{ :text=>'<!--- DO NOT TRANSLATE OR MODIFY any part of the hidden parameter(s) --->' },

# Default JavaScript
{ :text=>'var warningString = "<B>WARNING:</B> To maintain your login session, make sure that your browser is configured to accept Cookies.";' },

]

# Passive #
def passive
	m=[]

	# WWW-Authenticate # realm="Access Manager for e-business"
	m << { :name=>'HTTP WWW Authenticate header' } if @meta['www-authenticate'] =~ /realm="Access Manager for e-business"/

	# Return passive matches
	m

end

end


