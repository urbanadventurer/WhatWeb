##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "WordPressSpamFree"
authors [
  "Andrew Horton",
  # v0.2 # removed :certainty=>100. 
  "Brendan Coles <bcoles@gmail.com>", # v0.3 # 2011-02-18 # Updated version detection. 
]
version "0.3"
description "Wordpress SpamFree module. Get your WordPress Blog Spam-Free with this plugin. Normal users doesnt even know your using it. But it keeps away the spammers."
website "http://wordpress.org/extend/plugins/spam-free/"

# Matches #
matches [

# Version Detection # HTML Comments
{ :version=>/<!-- Protected by \(WP-SpamFree\) v([\d\.]+) :: JS BEGIN -->/ },

]

end

