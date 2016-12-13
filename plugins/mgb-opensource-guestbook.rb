##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MGB-OpenSource-Guestbook" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-22
version "0.1"
description "MGB OpenSource Guestbook"
website "http://www.m-gb.org/"

# Google results as at 2012-07-22 #
# 57 for 'inurl:"mgb/index.php?p="'

# Dorks #
dorks [
'inurl:"mgb/index.php?p="'
]



# Matches #
matches [

# Meta Copyright # Year Detection
{ :string=>/<meta name="copyright" content="MGB OpenSource Guestbook \(C\) Copyright 2004-(20[\d]{2}) by http:\/\/www\.m\-gb\.org\/">/ },

# HTML Comment
{ :text=>'<!-- If you want to remove this copyright you can do so. But it took and already takes a lot of time to code all this stuff.' },

# td class="entry_info"
{ :text=>'<td class="entry_info" colspan="3"><a href="email.php?id=denied">' },

# Footer # Year Detection
{ :string=>/<span class="copyright"><a href="http:\/\/www\.m\-gb\.org\/" title="MGB Homepage" target="_blank">MGB OpenSource Guestbook<\/a> &copy; 2004-(20[\d]{2})<br>/ },

]

end

