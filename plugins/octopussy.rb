##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Octopussy" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-12
version "0.1"
description "Perl/XML Logs Analyzer, Alerter & Reporter."
website "http://www.8pussy.org/"

# Google results as at 2012-09-12 #
# 1 for intitle:"Octopussy Login"

# Dorks #
dorks [
'intitle:"Octopussy Login"'
]



# Matches #
matches [

# input box
{ :text=>'<input type="submit" name="submit" value="Connect to Octopussy"></td>' },

# Version Detection
{ :version=>/<td class="box" align="center" >Octopussy ([^\s^<]+)<\/td>/ },

# Logo HTML
{ :text=>'<img border="0" src="IMG/octo_login1.png" alt="Octopussy Logo"></td>' },

# Title
{ :text=>'<title>Octopussy Login</title>' },

# Icon HTML
{ :text=>'<link rel="icon" type="image/gif" href="IMG/octopussy.gif">' },

]

end

