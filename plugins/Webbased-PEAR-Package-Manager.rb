##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webbased-PEAR-Package-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "Webbased PEAR Package Manager - The most accessible way to manage your pear-compatible packages."
website "http://pear.php.net/package/PEAR_Frontend_Web"

# Google results as at 2011-03-20 #
# 58 for "Installed packages" "Webbased PEAR Package Manager" "Search package by name"
# 24 for inurl:"index.php?command=list" filetype:php intitle:"PEAR Package Manager"
# 20 for filetype:php intitle:"PEAR Package Manager" "Warning: This package management website is not protected with a password, this is a MAJOR security risk. Please read the README."

# Dorks #
dorks [
'"Installed packages" "Webbased PEAR Package Manager" "Search package by name"'
]



# Matches #
matches [

# Logo
{ :text=>'<img src="?img=pear" width="104" height="50" vspace="2" hspace="5" alt="PEAR">' },

# Warning Message
{ :text=>'<b>Warning:</b> This package management website is <b>not protected</b> with a password, this is a MAJOR security risk. Please read the <a href="?command=doc-show&pkg=pear.php.net/PEAR_Frontend_Web&file=README" class="green">README</a>.' },

# Version Detection # pear.php.net/PEAR_Frontend_Web Package
{ :version=>/<td valign="top">[\s]+<a href="[^"]*\/index\.php\?command=info&pkg=pear\.php\.net\/PEAR_Frontend_Web" class="blue">PEAR_Frontend_Web<\/a>[\s]+<\/td>[\s]+<td valign="top">[\s]+([^<^\n]+)[\s]+<\/td>/ },

# Meta Description
{ :string=>/<meta name="description" content="Webbased PEAR Package Manager on ([^"]+)" \/>/ },

]

end


