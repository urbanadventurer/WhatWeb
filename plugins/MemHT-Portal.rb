##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MemHT-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-08
version "0.1"
description "MemHT Portal is a Free PHP CMS and Blog. It permits the creation and the management online of websites with few and easy steps. It's completely customizable, expandable and suitable for all needs."
website "http://www.memht.com/"

# Google results as at 2011-02-08 #
# 152 for "MemHT Portal is a free software released under the GNU/GPL License by Miltenovik Manojlo"

# Dorks #
dorks [
'"MemHT Portal is a free software released under the GNU/GPL License by Miltenovik Manojlo"'
]



# Matches #
matches [

# Default Meta Author
{ :text=>"<meta name='author' content='MemHT Portal (www.memht.com) - Miltenovik Manojlo'>" },

# Default HTML Comment
{ :text=>"// MemHT Portal is free, released under a very permissive license as" },

# Default Copyright Text
{ :text=>"<a href='http://www.memht.com' title='MemHT.com' target='_blank'><b>MemHT Portal</b></a> is a free software released under the GNU/GPL License by <a href='http://www.memht.com' title='MemHT.com' target='_blank'><b>Miltenovik Manojlo</b></a>" },

]

end


