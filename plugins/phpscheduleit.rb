##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "phpScheduleIt" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "A web-based resource scheduling system that allows administered management of reservations on any number of resources. Typical applications are conference room or machine reservation management. Written in PHP and tested on MySQL. "
website "http://phpscheduleit.sourceforge.net"
# Default login: admin/admin

# Google results as at 2010-08-01 #
# 9 for "powered by phpScheduleIt"

# Dorks #
dorks [
'"powered by phpScheduleIt"'
]



# Matches #
matches [

# Default Logo
{ :text=>'<div align="left"><img src="img/phpScheduleIt.png" alt="logo" vspace="5"/></div>' },

# Powered by text
{ :text=>'<p align="center">Powered by <a href="http://phpscheduleit.sourceforge.net">phpScheduleIt</a></p>' },
{ :text=>'<p align="right"><a href="http://phpscheduleit.sourceforge.net">Powered By phpScheduleIt' },
{ :text=>'<br>Powered By: phpScheduleIt</p>', :certainty=>75 },

# Version Detection # Powered by text
{ :version=>/<p align="center">[<!\-]*<a href="http:\/\/phpscheduleit.sourceforge.net">[\->]*Powered By phpScheduleIt v([\d\.]+)[<!\-]*<\/a>[\->]*<\/p>/ },

{ :version=>/<p align="center"><a href="http:\/\/phpscheduleit.sourceforge.net">phpScheduleIt v([\d\.]+)<\/a><\/p>/ },

{ :version=>/<p align="center">Powered by <a href="http:\/\/phpscheduleit.sourceforge.net">phpScheduleIt v([\d\.]+)<\/a><\/p>/ },

{ :version=>/[P|p]?owered by <a href="http:\/\/phpscheduleit.sourceforge.net"[^>]*>phpScheduleIt v([\d\.]+)<\/a>/ },

]

end

