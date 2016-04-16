##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-16 #
# Updated version detection
##
Plugin.define "MyHobbySite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.2"
description "MyHobbySite is a website Content Management System (CMS) programmed in PHP and tailored specifically for collectors of live music. Like any other CMS, MyHobbySite supports page creation, file management, and dynamic text editing via a WYSIWYG editor."
website "http://www.myhobbysite.net/"

# Google results as at 2010-09-12 #
# 71 for "Powered by MyHobbySite"

# Dorks #
dorks [
'"Powered by MyHobbySite"'
]



# Matches #
matches [

# Default title
{ :text=>' (Powered by MyHobbySite)</title>' },

# HTML comment
{ :text=>'					<!-- Removing the copyright notice without purchasing the MyHobbySite Copyright Removal License voids the MyHobbySite End User License Agreement -->' },

# HTML comment
{ :text=>'		<a name="top"></a> <!-- Necessary for the "jump to the top of the page" links -->' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="http:\/\/www.myhobbysite.net" target="_blank">MyHobbySite<\/a> ([\d\.]+) / },

]

end

