##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-12 #
# Updated version detection
##
Plugin.define "Webmedia-Explorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-07
version "0.2"
description "Webmedia Explorer scans and indexes everything under a folder called 'media' under the document root and builds a website automaticaly, generating file and folder listings, image galleries, message boards, news or simply text, anywhere it finds the corresponding data."
website "http://www.webmediaexplorer.com/"

# Google results as at 2010-11-07 #
# 51 for "Powered by webmedia explorer" "Marc Salmurri"



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.webmediaexplorer.com[^>]*>webmedia explorer ([\d\.]+)<\/a>/i },

]

end

