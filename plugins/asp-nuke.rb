##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "ASP-Nuke"
authors [
  "Andrew Horton",
  # v0.2 # Removed :name and :probability
  # v0.3 # Uses :version=>//. 
  # Andrew Horton, # v0.4 # 2016-04-17 # Added website parameter. 
  # Andrew Horton, # v0.5 # 2016-04-18 # Replaced passive function with :search=>"headers[p3p]" pattern. 
]
version "0.5"
description "ASP Nuke is an open-source software application for running a community-based web site on a web server. The requirements for the ASP Nuke content management system are: 1. Microsoft SQL Server 2000 and 2. Microsoft Internet Information Server (IIS) 5.0"
website "http://www.aspnuke.com/"

matches [
{:text=>"<meta name=\"Generator\" CONTENT=\"ASP-Nuke" },
{:text=>"<meta name=\"Generator\" content=\"ASPNuke" }, 
{:version=>"2", :text=>"<meta name=\"Generator\" content=\"ASPNUKE v2.0 - distributed under GPL license\">" },
{:regexp=>/<a href="\/gotoURL.asp\?url=/ }, #"
{:text=>"<a href=\"http://www.rot.dk\" target=\"_blank\">Asp-Nuke</a> community" },
{:regexp=>/<link rel="Shortcut Icon" href="[^>]*aspnuke.ico">/ },
{:regexp=>/<a href="http:\/\/www.aspnuke.it" target="_blank">ASP-Nuke [0-9\.]*<\/a>/ },
{:regexp=>/<form name='Authentication' method='post' action='[^']*\/authent.asp'>/ }, #'
{:text=>"Designed with <a href=\"http://www.asp-nuke.net\" target=\"_blank\">ASP-Nuke</a>" },
{:version=>"v1.1+", :text=>"<br>Designed with ASP-Nuke v1.1+" },

{:version=>/<meta name="Generator" (content|CONTENT)="(ASPNUKE|ASP-Nuke) ([^->"]+)/, :offset=>2,  :name=>"meta generator tag" },

{:version=>/Designed with <a href="http:\/\/www.asp-nuke.net" target="_blank">ASP-Nuke<\/a> ([^<]+)<br>/,  :name=>"desgined by" },

{:version=>/<a href="http:\/\/www.aspnuke.it" target="_blank">Asp-Nuke ([\d\.]+)<\/a>/,  :name=>"aspnuke.it" },

{:name=>"P3P Privacy Headers", :certainty=>25, :search=>"headers[p3p]", :text=>"CP=\"NOI CUR OUR IND UNI COM NAV INT\"" },

]

end
