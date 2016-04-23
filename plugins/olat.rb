##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OLAT" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "OLAT - Online Learning And Training. OLAT offers a flexible online course system along with extensive features to guarantee learning and teaching independent of time and place. It has been created especially for public institutions such as universities, academies or colleges, but it is also suitable for other businesses."
website "http://www.olat.org/website/en/html/index.html"

# Google results as at 2011-06-04 #
# 13 for intitle:"OLAT - Online Learning And Training" "OLAT password"

# Dorks #
dorks [
'intitle:"OLAT - Online Learning And Training" "OLAT password"'
]



# Matches #
matches [

# Version Detection # div id="b_footer_version"
{ :version=>/<div id="b_footer_version">[\s]+<a href="http:\/\/www\.olat\.org"  title="Homepage of Open Source LMS OLAT" target="_blank">OLAT ([^<]+)<\/a>/ },

# Version Detection # div id="o_footer_version"
{ :version=>/<div id="o_footer_version">[\s]+<a href="http:\/\/www\.olat\.org"  title="Homepage of Open Source LMS OLAT" target="_blank">[\s]+OLAT ([^<^\n]+)[\s]+<\/a>/ },

# Meta DC tags
{ :certainty=>25, :text=>'<meta name="DC.creator" content="University of Zurich - http://www.uzh.ch" />' },
{ :certainty=>75, :text=>'<meta name="DC.subject" content="OLAT - Online Learning And Training - Your Open Source Learning Management System" />' },
{ :text=>'<meta name="DC.contributor" content="see http://www.olat.org/website/en/html/download_license.html" />' },

# Title
{ :text=>'<title>OLAT - Online Learning And Training</title></head>' },
{ :text=>'<title>OLAT - Online Learning And Training </title>' },

# Body
{ :certainty=>75, :text=>'<body onload="b_start();" id="b_body" class="b_lang_en">' },
{ :certainty=>75, :text=>'<body onload="b_start();" id="b_body">' },
{ :certainty=>75, :text=>'<body onload="o2start();" class="o_body">' },

# HTML Comment
{ :text=>'<!-- START olatContentPanel -->' },

# Malformed HTML # Present on older versions ~5.x
{ :text=>'<a accesskey="2" href="#content" title="Go to "Content""></a>' },

]

end

