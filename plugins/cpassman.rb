##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "cPassMan" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "cPassMan is a Passwords Manager dedicated for managing passwords in a collaborative way. It is especially designed to provide passwords access security for allowed people."
website "http://www.cpassman.org/"

# Google results as at 2011-04-12 #
# 63 results for intitle:"Collaborative Passwords Manager"

# Dorks #
dorks [
'intitle:"Collaborative Passwords Manager"'
]



# Matches #
matches [

# Login page # Default title
{ :text=>'<title>Collaborative Passwords Manager</title>' },

# Version detection # Login page
{ :version=>/<a href="http:\/\/cpassman.org[\/]?" target="_blank">cPassMan<\/a> ([^\ ]+)/ },

# License HTML
{ :text=>'<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/" title="Collaborative Passwords Manager by Nils Laumaill&#233; is licensed under a Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 License" target="_blank">' },

]

end

