##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Redaxscript" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-22
version "0.1"
description "Redaxscript is a free, PHP and MySQL driven website engine for small business and private websites. It's ultra lightweight, simple and customizable."
website "http://redaxscript.com/"

# Google results as at 2011-06-22 #
# 51 for "Powered by Redaxscript"

# Dorks #
dorks [
'"Powered by Redaxscript"'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by <a href="http://redaxscript.com">Redaxscript</a>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Redaxscript ([^\s^"]+)" \/>/ },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/redaxscript\.com" title="Redaxscript">Redaxscript<\/a> ([^\s^<]+)</ },

]

end

