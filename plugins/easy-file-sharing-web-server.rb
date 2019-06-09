##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Easy-File-Sharing-Web-Server"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-08
  "Andrew Horton", # v0.2 # 2016-04-19 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "Easy File Sharing Web Server is a file sharing software that allows visitors to upload/download files easily through a Web Browser"
website "http://www.sharing-file.com/"

# ShodanHQ results as at 2011-04-08 #
# 656 for Easy File Sharing Web Server

matches [
	# Version Detection # HTTP Server Header
	{ :version=>/^Easy File Sharing Web Server v(.+)$/, :search=>"headers[server]" },
]

end

