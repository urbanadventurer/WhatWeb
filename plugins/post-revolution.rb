##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Post-Revolution"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-08-06
]
version "0.1"
description "Post Revolution - CMS"
website "http://postrev.com.ar/"

# Google results as at 2011-08-06 #
# 39 for "Powered by Post Revolution"
# 85 for inurl:verpost.php?id_noticia

# Dorks #
dorks [
'"Powered by Post Revolution"',
'inurl:verpost.php?id_noticia'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.postrev.com.ar/">Post Revolution</a>' },

]

end

