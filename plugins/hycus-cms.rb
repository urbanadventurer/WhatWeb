##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Hycus-CMS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-12
]
version "0.1"
description "India's first CMS. Free and open-source PHP based CMS."
website "http://www.hycus.com/"

# 1 result for "powered by Hycus CMS" @ 2010-09-12

# Dorks #
dorks [
'"powered by Hycus CMS"'
]



matches [

# Meta generator
{ :text=>'<meta name="generator" content="Hycus - Open Source PHP Based Content Management" />' },

# Powered by text
{ :text=>'Powered By <a href="http://www.hycus.com" target="_blank" >Hycus-CMS</a>. Developed By <a href="http://www.hycus.com" target="_blank" >Hycus Team</a>.' },

]

end

