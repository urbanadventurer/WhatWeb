##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Seo-Panel" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-26
version "0.1"
description "A complete open source seo control panel for managing search engine optimization of your websites. Seo Panel is a seo tool kit includes latest hot seo tools to increase and track the performace of your websites."
website "http://www.seopanel.in/"

# Google results as at 2011-02-26 #
# 9 for intitle:"Seo Panel: Login section"

# Dorks #
dorks [
'intitle:"Seo Panel: Login section"'
]



# Matches #
matches [

# Login Page # Default Title
{ :text=>"<title>Seo Panel: Login section</title>" },

# Default JavaScript Prompt Message
{ :text=>"var wantproceed = 'Do you really want to proceed?';" },

# Default JavaScript Prompt Message # German
{ :text=>"var wantproceed = 'Wollen Sie wirklich fortfahren?';" },

# Error Page # Error Message
{ :text=>"<p class='note error'><p style='color:red'>You don't have permission to access this page!</p></p>" },

# Meta Description
{ :certainty=>75, :text=>'<meta name="description" content="Login to Seo Panel and utilise seo tools and plugins to increase the perfomance of your site." />' },

# Default NoScript Message
{ :certainty=>75, :text=>'<p class="note error">JavaScript is turned off in your web browser. Turn it on to take full advantage of this site, then refresh the page.</p>' },

]

end


