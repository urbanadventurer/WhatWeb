##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-17 #
# Updated version detection
##
Plugin.define "Flax-Article-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.2"
description "Managing large dynamic websites has always been a difficult task for several webmasters, we have developed Flax Article Manager keeping you in mind. By using this system one can easily manage their news and/or articles quite easily."
website "http://www.flaxweb.com/products/articles"

# Dorks #
dorks [
'intitle:"Flax Article CMS Administration Panel"'
]



# Matches #
matches [

# Default image HTML
{ :text=>'/images/flaxweb_newsletter_bg.gif" bgcolor="#FFFFFF" valign="top"> ' },

# Default Article link HTML
{ :text=>'<b><a href="http://www.flaxweb.com/products/articles"><font color="#666666">Article ' },

# Admin Panel
{ :text=>'<title>Flax Article CMS Administration Panel</title>' },
{ :text=>'recent updates for Flax Article Manager</font></b></a></div>' },
{ :text=>'<td width=67%><font color=#FFFFFF><a href=admin.php class=htext>Flax ' },

# 403 Error text (/admin/ directory, for example)
{ :text=>'<td><a href="http://www.flaxweb.com/products/articles">For more details about Flax article manager (CMS) please click ' },

# Version Detection # Copyright footer text
{ :version=>/[\s]+Copyright [0-9]{4} &copy; Flax Article Manager v([\d\.]+)<\/div>/ },

]

end

