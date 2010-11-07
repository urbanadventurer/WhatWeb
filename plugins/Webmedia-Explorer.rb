##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webmedia-Explorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-07
version "0.1"
description "Webmedia Explorer scans and indexes everything under a folder called 'media' under the document root and builds a website automaticaly, generating file and folder listings, image galleries, message boards, news or simply text, anywhere it finds the corresponding data. And all this information can be managed using a contextual menu (right mouse button) just like you do it with your file explorer on your PC (copy, paste, edit, etc...) so, there is no need for an admin backend and administrating a site has never been so easy! - homepage: http://www.webmediaexplorer.com/"

# 51 Google results for "Powered by webmedia explorer" "Marc Salmurri"
examples %w|
demo.webmediaexplorer.com
www.webmediaexplorer.com
|

# Passive #
def passive
	m=[]

	# Version Detection # Powered by text
	m << { :version=>@body.scan(/Powered by <a href="http:\/\/www.webmediaexplorer.com[^>]*>webmedia explorer ([\d\.]+)<\/a>/i) } if @body =~ /Powered by <a href="http:\/\/www.webmediaexplorer.com[^>]*>webmedia explorer ([\d\.]+)<\/a>/i

	m

end

end

