##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Diferior-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Diferior is a multi-purpose content management system, meaning that it provides all the necessary tools to easily publish and organize your content."
website "http://diferior.com/"

# 62 results for "Powered by Diferior, Copyright" @ 2010-09-18

# Dorks #
dorks [
'"Powered by Diferior, Copyright"'
]



matches [

# Default title
{ :text=>'&#8212; Powered by Diferior</title>' },

# Copyright text
{ :regexp=>/<a href="http:\/\/diferior.com" rel="external_dif[^>]+>Powered by Diferior, Copyright &copy; 2007, 2008 Povilas Musteikis<\/a><br\/>/ },

]

end

