##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Google-Search-Appliance" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-16
version "0.1"
description "The Google Search Appliance (GSA) is a piece of hardware that corporations install on-premise so that employees can search enterprise data."
website "http://www.google.com/enterprise/search/gsa.html"

# ShodanHQ results as at 2011-09-16 #
# 4 for EnterpriseController
# 2 for GSE EnterpriseController

# Google results as at 2011-09-16 #
# 19 for inurl:"EnterpriseController" -code



# Matches #
matches [

{ :text=>'<font face=arial,sans-serif size=-1>If you are an end user looking for a Google search service on your network, please ask your system administrator for the URL of the search service.<p>' },

# HTTP Server Header
{ :certainty=>75, :search=>"headers[server]", :regexp=>/^GSE$/ },

# Location Header
{ :certainty=>75, :search=>"headers[location]", :regexp=>/^\/EnterpriseController/ },

# About Google Search Appliance
{ :text=>'<tr id="TopBar"><td id="TopBarName">About Google Search Appliance</td></tr></table></td></tr></table>' },

# Welcome to the Google Search Appliance!
{ :text=>'<tr id="TopBar"><td id="TopBarName">Welcome to the Google Search Appliance!</td></tr></table></td></tr></table>' },

# Welcome to the Google Mini!
{ :text=>'<tr id="TopBar"> <td id="TopBarName">  Welcome to the Google Mini!  </td> </tr> </table>' },

# Version Detection # /EnterpriseController?actionType=about
{ :version=>/<\/font>[\s]+<br><br>[\s]+<font face="arial,sans-serif">System Version:[\s]+([^\s]+)[\s]+<\/font>[\s]+<br><br>[\s]+<font face="arial,sans-serif">Appliance ID:/ },

]

end

