##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PegaRULES" do
author "Andrew Horton"
version "0.2"
description "PegaRULES Process Commander is BPM software from Pega. Many of the world's leading organizations use Pega to drive revenue growth, improve customer experience, and enhance operational efficiency. Pega's unified offering is recognized by industry analysts as a leader in CRM, BPM, case management and business rules"
website "http://www.pega.com/"

# extra URLs /prweb/

# Google results as at 2012-10-06 #
# 4 for inurl:"prweb/PRServlet" intitle:"Welcome to PegaRULES"

# ShodanHQ results as at 2012-10-06 #
# 3 for prweb/PRServlet

# Dorks #
dorks [
'intitle:"Welcome to PegaRULES"',
'inurl:/prweb/PRServlet/'
]



# Matches #
matches [

# Pega-RULES Cookie
{:name=>'cookie',:search=>"headers[set-cookie]",:text=>"Pega-RULES"},

# Title
{:name=>'title', :text=>'<title> Welcome to PegaRULES </title>' },

# Footer
{:name=>'copyright footer',:regexp=>/<span>[^<]+Copyright[^<]+Pegasystems Inc/m},

# favicon
{:name=>'shortcut icon',:text=>'<LINK REL="SHORTCUT ICON" HREF="images/pzPegaIcon.ico">'},

# Version Detection
{ :version=>/td style="text-align: center;"><span id="ProductVersion" class="ProductVersion">Version ([^<]+)<\/span><\/td/ },

# Login Page # HTML Comment
{ :text=>'<!-- B-12380 avoid reuse/repost of username/password -->' },

# Error Page
{ :text=>'<HEAD><H3>Unable to logon to the PegaRULES system.</H3></HEAD>' },

# 403 Forbidden Page
{ :regexp=>/<TR><TD>\s+<FONT face="Helvetica">\s+Your system policy has denied access to the requested URL\.\s+<\/FONT>/ },

]

end
