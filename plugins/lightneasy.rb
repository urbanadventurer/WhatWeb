##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LightNEasy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-10
version "0.1"
description "LightNEasy is a simple and light Content Management System and Website Builder"
website "http://www.lightneasy.org/"

# Google results as at 2011-09-10 #
# 331 for inurl:"LightNEasy.php?page="
# 311 for "Powered by LightNEasy Content Manager"
# 142 for "If you are seeing this, that means LightNEasy installation worked!"

# Dorks #
dorks [
'inurl:"LightNEasy.php?page="',
'"Powered by LightNEasy Content Manager"',
'"If you are seeing this, that means LightNEasy installation worked!"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name='generator' content='LightNEasy( Mini)? ([^'^>]+)' \/>/, :offset=>1 },

# Version Detection # HTML Comment
{ :version=>/<!-- \+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+[\s]+\| LightNEasy ([^\s]+) Content Management System[\s]+\| / },
{ :version=>/<!-- \+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+[\s]+\| LightNEasy Content Management System[\s]+\| Copyright 2007-20[\d]{2} Fernando Baptista[\s]+\| http:\/\/(www\.)?lightneasy\.org[\s]+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+[\s]+\| [^\|]+ version ([^\s]+)/, :offset=>1 },

# Database Type Detection # HTML Comment
{ :string=>/<!-- \+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+[\s]+\| LightNEasy [^\s^\|]* Content Management System[\s]+\| ([^\|]+) version[\s]+/ },
{ :string=>/<!-- \+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+[\s]+\| LightNEasy [^\s^\|]* Content Management System[\s]+\| Copyright 2007-20[\d]{2} Fernando Baptista[\s]+\| http:\/\/(www\.)?lightneasy\.org[\s]+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+\+[\s]+\| ([^\|]+) version [^\s]+/, :offset=>1 },

# Stylesheet
{ :text=>"<link rel='stylesheet' type='text/css' href='css/lightneasy.css' />" },

# Version Detection # Powered by footer
{ :version=>/Powered by <a href="http:\/\/lightneasy\.org">LightNEasy ([^<]+)<\/a>/ },

# Version Detection # Fresh install message
{ :version=>/<h1>LightNEasy ([^<^\s]+) index page<\/h1><p>If you are seeing this, that means <strong>LightNEasy<\/strong> installation worked!<\/p>/ },
{ :version=>/<h2 class="LNE_title">LightNEasy ([^<^\s]+) index page<\/h2><p>If you are seeing this, that means <strong>LightNEasy<\/strong> installation worked!<\/p>/ },

]

end

