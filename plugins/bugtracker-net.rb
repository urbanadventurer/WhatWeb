##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.1 # 2016-05-10
# David P Robinson <david@intruder.io>
# Intiial version of plugin created
##

Plugin.define "BugTracker.NET" do
author "David P Robinson <david@intruder.io>"
version "0.1"
description "BugTracker.NET is a free, open-source, web-based bug tracking and general purpose issue tracking application. It is written using ASP.NET, C#, and Microsoft SQL Server"
website "http://ifdefined.com/bugtrackernet.html"

# Matches
matches [

  { :text => '<link rel="StyleSheet" href="btnet.css" type="text/css">', :certainty => 75 },

  { :regexp => /Copyright 20[0-9]{2}-20[0-9]{2} Corey Trager/, :certainty => 75 },

  { :text => '<td width=100 valign=middle><a href=http://ifdefined.com/bugtrackernet.html>' },

  {:url => "/favicon.ico", :md5 => '64c3f2ea9d52e46b69b558b88c1cff31' },

  { :url => "/about.html", :version => /Version ([0-9a-z\.]+).*BugTracker.NET/m }

]

end
