##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XenForo" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-16
version "0.1"
description "XenForo is a commercial Internet forum software written in the PHP programming language using the Zend Framework."
website "http://xenforo.com/"

# ShodanHQ results as at 2012-01-16 #
# 123 for xf_session

# Google results as at 2012-01-16 #
# 202 for "Forum software by XenForo" "XenForo Ltd"

# Dorks #
dorks [
'"Forum software by XenForo" "XenForo Ltd"'
]



# Matches #
matches [

# StyleSheet
{ :text=>'<link rel="stylesheet" href="css.php?css=xenforo,form,public&amp;style=' },
{ :text=>'<link rel="stylesheet" type="text/css" href="css.php?css=xenforo,form,public&amp;style=' },

# html tag
{ :text=>'<html id="XenForo" ' },

# Meta Description
{ :text=>'<meta name="description" content="Forum software by XenForo" />' },

# HTML Comment
{ :certainty=>75, :text=>'<!-- h1 title, description -->' },

# Set-Cookie # xf_session
{ :certainty=>25, :search=>"headers[set-cookie]", :regexp=>/xf_session=[a-f\d]{32};/ },

# div id="copyright" # Year Detection
{ :string=>/<div id="copyright">Forum software by XenForo&trade; &copy;(20[\d]{2}) XenForo Ltd\.<\/div>/ },

]

end

