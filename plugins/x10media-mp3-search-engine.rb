##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "X10media-MP3-Search-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "X10media MP3 search engine"
website "http://www.x10media.com/mp3-script.php"

# Google results as at 2010-08-01 #
# 134 for "powered by x10media.com a MP3 Search Script"
# 196 for "This search engine is in no way intended for illegal downloads. "

# Dorks #
dorks [
'"powered by x10media.com a MP3 Search Script"',
'"This search engine is in no way intended for illegal downloads. "'
]



# Matches #
matches [

# Meta Tags
{ :text=>'	<meta name="copyright" content="X10Media"/>', :certainty=>75 },
{ :text=>'	<meta name="contributor" content="X10Media"/>', :certainty=>75 },

# Default Title
{ :text=>"<title>x10media Mp3 Search Engine</title>" },

# Powered by text
{ :text=>'Powered by <a href="http://www.x10media.com">x10media.com</a> a <a href="http://www.x10media.com/mp3-script.php">MP3 Search Script</a>' },

# Database Error
{ :text=>'Cannot connect to the database. Possibly, the X10Media Mp3 Search engine is not installed. Click <a href="install/">here</a>, to install it.' },

# Version Detection
{ :version=>/<meta name="publisher" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<meta name="dc\.rights" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<meta name="dc\.publisher" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<meta name="owner" content="x10media`s Mp3 Search Engine V\.([\d\.]+)"\/>/ },

{ :version=>/<title>x10media`s Mp3 Search Engine V\.([\d\.]+)[\ Installer]*<\/title>/ },

]

end

