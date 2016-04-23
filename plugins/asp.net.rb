##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb

# TODO
# add detection true/false for ViewState MAC and Encryption
##
# Version 0.6 # 2016-04-18 # Andrew Horton
# Replaced passive function with match for:
# 1. x-powered-by HTTP header
# 2. X-AspNet-Version HTTP header
# 3. AnonymousIdentificationModule
##
# Version 0.5 # 2014-06-12
# Added Detailed errors and ViewState Encrypted. 
##
# Version 0.4 # 2011-03-03 #
# Merged x-aspnetmvc-version plugin
##
# Version 0.3 # 2011-02-19 #
# Added AnonymousIdentificationModule detection
##
# Version 0.2 # 2011-01-28 #
# Added version detection
##
Plugin.define "ASP_NET" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-10
version "0.6"
description "ASP.NET is a free web framework that enables great Web applications. Used by millions of developers, it runs some of the biggest sites in the world."
website "http://www.asp.net/"

# The Global.asa file is an optional file that can contain declarations of objects, variables, and methods that can be accessed by every page in an ASP application. All valid browser scripts (JavaScript, VBScript, JScript, PerlScript, etc.) can be used within Global.asa. The Global.asa file must be stored in the root directory of the ASP application, and each application can only have one Global.asa file. - http://www.w3schools.com/ASP/asp_globalasa.asp

# Web.config is the main settings and configuration file for an ASP.NET web application. The file is an XML document  that defines configuration information regarding the web application. The web.config file contains information that control module loading, security configuration, session state  configuration, and application language and compilation settings. Web.config files can also contain application specific items such as database connection strings. - http://en.wikipedia.org/wiki/Web.config

# AnonymousIdentificationModule - http://msdn.microsoft.com/en-us/library/system.web.security.anonymousidentificationmodule.aspx

# Google results as at 2010-09-28 #
# 29 for inurl:web.config ext:config "ConnectionString"
# 31 for inurl:global.asa ext:asa "ConnectionString"

# ShodanHQ results as at 2011-01-28 #
# 3,356,722 for "asp.net"
# 254,949 for X-AspNet-Version
# 7,460 for Set-Cookie chkvalues anonymousID
# 2,4582 for "asp.net" -IIS

# Dorks #
dorks [
'inurl:web.config ext:config "ConnectionString"',
'inurl:global.asa ext:asa "ConnectionString"'
]



# Matches #
matches [

	# Default web settings title
	{ :text=>'vti_title:SR|Web Settings for Active Server Pages' },

	# Get connection strings # global.asa
	{ :string=>/connectionstring=DRIVER=([^\n]+)/ },
	{ :string=>/connectionstring=Provider=([^\n]+)/ },

	# Get connection strings # web.config
	{ :string=>/connectionString="([^\"]+)/ },
	{ :string=>/<add key="ConnectionString" value="([^\"]+)/ },

	# Detailed errors
	{ :search=>"body", :string=>"Verbose error messages", :text=> "This error page might contain sensitive information because ASP.NET is configured to show verbose error messages"},
	{ :search=>"body", :filepath=>/<b> Source File: <\/b> ([^<]+)<b> &nbsp;&nbsp; Line:.*This error page might contain sensitive information because ASP.NET/},
	
	# VIEWSTATEENCRYPTED
	{ :string=>"ViewState Encrypted", :search=>"body", :text=>'name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED"'},

	# x-powered-by HTTP header
	{ :name=>"x-powered-by HTTP header", :search=>"headers[x-powered-by]", :regexp=>/asp\.net/ },

	# Version Detection # X-AspNet-Version HTTP header
	{ :name=>"X-AspNet-Version HTTP header", :search=>"headers[x-aspnet-version]", :version=>/^(.*)$/ },

	# AnonymousIdentificationModule
	{ :module=>"AnonymousIdentificationModule", :search=>"headers[set-cookie]", :regexp => /^anonymousID=[^;]+; expires=[^;]+; path=[^;]+; HttpOnly/},
	{ :module=>"AnonymousIdentificationModule", :search=>"headers[set-cookie]", :regexp => /^chkvalues=[^;]+; expires=[^;]+; path=[^;]+; HttpOnly/},

]

# Passive #
def passive
	m=[]

	# Version Detection # X-AspNetmvc-version HTTP header
	m << { :string=>"MVC"+@headers['x-aspnetmvc-version'].to_s } unless @headers['x-aspnetmvc-version'].nil?

	# Return passive results
	m

end

end

