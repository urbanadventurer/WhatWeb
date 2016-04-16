##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Barts-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "Bart's CMS is a website Content Management System that is build with Codecharge Studio."
website "http://trinityhome.org/"

# Google results as at 2011-03-03 #
# 93 for "powered by Bart's CMS"

# Dorks #
dorks [
'"powered by Bart\'s CMS"'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered by <a style="color:#ccc;" href="http:\/\/trinityhome.org(\/|\/barts_cms\/)"  title="Bart's CMS \[Business Edition\] Version ([\d\.]{1,10}) \[(Stable|Beta)\]" >Bart's CMS<\/a>/, :offset=>1 },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Bart's CMS \[Business Edition\] ([\d\.]{1,10}) [Stable][^>]*">/ },

# Meta Author
{ :certainty=>75, :text=>'<meta name="author" content="Bart Verstricht" />' },

]

end


