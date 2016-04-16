##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MantisBT" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-12
version "0.1"
description "MantisBT is a popular free web-based bug tracking system. It is written in PHP works with MySQL, MS SQL, and PostgreSQL databases."
website "http://www.mantisbt.org/"

# Google results as at 2011-03-12 #
# 246 for "Powered by Mantis Bugtracker"
# 11  for intitle:"MantisBT Administration" "Checking Installation"
# 4   for intitle:"MantisBT Administration - Installation" ext:php "Checking Installation"

# Dorks #
dorks [
'"Powered by Mantis Bugtracker"'
]



# Matches #
matches [

# Logo Link # >= 1.1.x
{ :regexp=>/<div align="right"><a href="http:\/\/www.mantisbt.org" title="Free Web Based Bug Tracker"><img src="[^"]*images\/mantis_logo_button.gif" width="88" height="35" alt="Powered by Mantis Bugtracker" border="0" \/><\/a><\/div>/ },

# Logo Link # <= 1.0.x
{ :regexp=>/<div align="right"><a href="http:\/\/www.mantis(bugtracker.com|bt.org)" title="Powered by Mantis Bugtracker"><img src="[^"]*images\/mantis_logo_button.gif" width="88" height="35" alt="Powered by Mantis Bugtracker" border="0" \/><\/a><\/div>/ },

# Version Detection # >= 1.1.x
{ :version=>/<span class="timer"><a href="http:\/\/www.mantisbt.org\/" title="Free Web Based Bug Tracker">Mantis(BT)? ([\d\.]+)<\/a>\[<a href="http:\/\/www.mantisbt.org\/"  title="Free Web Based Bug Tracker" target="_blank">\^<\/a>\]<\/span>/, :offset=>1 },

# Version Detection # <= 1.0.x
{ :version=>/<span class="timer"><a href="http:\/\/www.mantis(bugtracker.com|bt.org)\/">Mantis ([\d\.]+)<\/a>\[<a href="http:\/\/www.mantis(bugtracker.com|bt.org)\/" target="_blank">\^<\/a>\]<\/span>/, :offset=>1 },

# Install Page # Default Title
{ :string=>"Install", :text=>"<title> MantisBT Administration - Installation  </title>" },

]

end


