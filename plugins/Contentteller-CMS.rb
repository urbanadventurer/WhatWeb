##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Contentteller-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "Contentteller - A powerful Content Management System with 20 modules designed for high traffic websites."
website "http://www.contentteller.com/en/"

# Google results as at 2011-03-03 #
# 39 for "powered by Contentteller"

# Dorks #
dorks [
'"powered by Contentteller"'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="Esselbach Contentteller CMS" />' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.contentteller.com">Contentteller&reg; (Business Edition|Standard Edition)<\/a><img src="index.php\?ct=core&amp;action=tasks" alt="" \/>/ },

]

end


