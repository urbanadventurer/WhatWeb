##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "File-Upload-Manager"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-05 
  # v0.2 # 2011-02-19 # Updated version detection. 
  "Andrew Horton", # v0.3 # 2016-04-17 # Added website parameter. 
]
version "0.3"
description "Web based file upload manager written in PHP."
website "http://www.mtnpeak.net"

# Google results as at 2010-06-05 #
# 559 for +intitle:"File Upload Manager" "rename to" "file types allowed"

# Dorks #
dorks [
'intitle:"File Upload Manager" "rename to" "file types allowed"'
]



# Matches #
matches [

# GHDB Match # http://johnny.ihackstuff.com/ghdb/?function=detail&id=734
{ :certainty=>75, :ghdb=>'+intitle:"File Upload Manager" "rename to" "file types allowed"' },

# Default title
{ :certainty=>75, :text=>'<title>File Upload Manager</title>' },

# Default HTML copyright comment
{ :text=>'<!-- Copyright (c) 2003 thepeak. Get your own copy of this free PHP script from www.mtnpeak.net -->' },

# Default copyright text
{ :text=>'<a href="http://www.mtnpeak.net" style="text-decoration: none; color: #C0C0C0; font-size: 9px; cursor: default";>&copy; thepeak</a>' },

# Version Detection # Default HTML Comment
{ :version=>/<!-- File Upload Manager v([\d\.]+[^>]+) -->/ },

]

end

