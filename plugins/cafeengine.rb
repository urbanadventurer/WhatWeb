##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CafeEngine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "CafeEngine is a professional CMS for cafe or restaurant web site with integrated shopping cart. It's not a set of scripts only, but allow to provide new level of service to restaurant visitors and administration. "

# Google results as at 2011-03-03 #
# 25 for Copyright CafeEngine "2008-2009"

# Dorks #
dorks [
'Copyright CafeEngine "2008-2009"'
]



# Matches #
matches [

# Copyright Link
{ :text=>'  <td id="footer">Copyright &copy; <a href="http://cafeengine.com">CafeEngine</a> 2008-2009</td>' },

# Copyright Text
{ :text=>'  <td id="footer">Copyright &copy; CafeEngine</a> 2008-2009</td>' },

# Copyright Link # Admin Page
{ :text=>'  <td id=footer>Copyright &copy; <a href=http://cafeengine.com>CafeEngine.com</a> 2008-2009</td>' },

# Default JavaScript
{ :text=>'  win = window.open(src,"","top=20,left=20,height=" + h + ",width=" + w + ",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes")' },

]

end


