##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHPKIT" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-30
version "0.1"
description "PHPKIT WCMS - Web content management system to easily create your personal homepage, blog or business website."
website "http://www.phpkit.com/"

# Google results as at 2011-01-30 #
# 11,700,000 for "PHPKIT ist eine eingetragene Marke der mxbyte GbR"
# 12,000,000 for "Diese Website wurde mit PHPKIT WCMS erstellt"

# Dorks #
dorks [
'"PHPKIT ist eine eingetragene Marke der mxbyte GbR"',
'"Diese Website wurde mit PHPKIT WCMS erstellt"'
]



# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta name="generator" content="PHPKIT WCMS \- Web Content Managment System \- mxbyte GbR copyright [\d]{4}\-[\d]{4}" \/>/ },
{ :regexp=>/<meta name="generator" content="PHPKIT WCMS Web Content Management System" \/>/ },

# Meta Author
{ :text=>'<meta name="author" content="PHPKIT WCMS - Web Content Management System - Copyright mxbyte GbR" />' },

# Copyright HTML
{ :text=>'<div id="pkcopyright"><a class="none" href="http://www.phpkit.com">PHPKIT ist eine eingetragene Marke der mxbyte GbR &copy;' },

# Admin Page # Meta Description
{ :text=>'<meta name="description" content="PHPKIT, WCMS, Web Content Management System, Administration" />', :module=>"Admin Page" },

]

end


