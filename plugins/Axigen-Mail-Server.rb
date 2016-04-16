##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-07 #
# Updated version detection
##
Plugin.define "Axigen-Mail-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.2"
description "Axigen is an integrated email, calendaring & collaboration platform, masterfully built on our unique Linux mail server technology, for increased speed & security."
website "http://www.axigen.com/"

# Google results as at 2010-09-17 #
# 67 for "powered by Axigen Mail Server"

# Dorks #
dorks [
'"powered by Axigen Mail Server"'
]



# Matches #
matches [

# Login redirect page # Javascript
{ :text=>'            top.opener.location.href="/?login=";' },

# Powered by text
{ :text=>'<div>Powered by <a href="http://www.axigen.com" target="_blank" class="gray">Axigen Mail Server</a></div>' },

# Powered by text
{ :text=>'Powered by <a href="http://www.axigen.com/" target="_blank">Axigen Mail Server</a>' },

# "Javascript required" HTML
{ :text=>'<div class="nojsContainer"><h1>In order to access AXIGEN Webmail, <br />you must enable Javascript in your browser!</h1></div>' },

# Version Detection # Default title
{ :version=>/<title>AXIGEN Webmail - v([\d\.]+)<\/title>/ },

]

# Passive #
def passive
        m=[]

	# Version Detection # Powered by text
	# Tested versions: 7.3.1, 7.3.2, 7.3.3, 7.4.0, 7.4.2, 7.5.0, 7.5.0.30.1
	if @body =~ /<p>Powered by <a href="http:\/\/www.axigen.com[\/]*" target="_blank">Axigen Mail Server<\/a><\/p>[\s\r\n]*<p>Version ([\d\.]+)<\/p>/
		m << { :version=>@body.scan(/<p>Version ([\d\.]+)<\/p>/)[0][0] }
	end

	m

end

end

