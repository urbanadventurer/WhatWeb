##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Claroline" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "Claroline is an Open Source eLearning and eWorking platform allowing teachers to build effective online courses and to manage learning and collaborative activities on the web. Translated into 35 languages, Claroline has a large worldwide community"
website "http://www.claroline.net/"

# Google results as at 2011-03-24 #
# 466 for "Powered by Claroline"

# Dorks #
dorks [
'"Powered by Claroline"'
]



# Matches #
matches [

# Year Detection # Indicates the age of install # Powered by text
# `[^<]{1,20}` section is to detect multiple languages
{ :string=>/<div id="poweredBy">[^<]{1,20}<a href="http:\/\/www\.claroline\.net" target="_blank">Claroline<\/a> &copy; 2001 - (20[\d]{2})<\/div>/ },

# link tags
{ :certainty=>75, :text=>'<link href="http://www.claroline.net/documentation.htm" rel="Help" />' },
{ :certainty=>75, :text=>'<link href="http://www.claroline.net/credits.htm" rel="Author" />' },
{ :certainty=>75, :text=>'<link href="http://www.claroline.net" rel="Copyright" />' },

]

end


