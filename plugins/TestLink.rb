##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TestLink" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-21
version "0.1"
description "TestLink - open source test management tool"
website "http://www.teamst.org/"

# Google results as at 2012-02-21 #
# 26 for intitle:"TestLink" "New User" "Lost Password" "TestLink project Home" "TestLink is licensed under the GNU GPL"

# Dorks #
dorks [
'intitle:"TestLink" "New User" "Lost Password" "TestLink project Home" "TestLink is licensed under the GNU GPL"'
]



# Matches #
matches [

# Meta Author
{ :certainty=>75, :text=>'<meta name="author" content="Martin Havlat" />' },

# Login Page # Logo HTML # Version Detection
{ :version=>/\.png" \/>[\s]*<br \/>TestLink ([^\s^<]+)/ },

# Login Page # homepage link HTML
{ :text=>'TestLink project <a href="http://testlink.sourceforge.net/docs/testLink.php">Home</a><br />' },

# Redirect Page # Expired session
{ :regexp=>/<html><head><\/head><body><script type='text\/javascript'>location\.href='https?:\/\/[^\'^\?]+\/login\.php\?note=expired';<\/script><\/body><\/html>/ },

]

end

