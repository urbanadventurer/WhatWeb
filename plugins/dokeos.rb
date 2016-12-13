##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dokeos" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "Dokeos is an open source online learning suite. It provides all the features needed for e-learning and blended learning management : From Authoring to Reporting."
website "http://www.dokeos.com/"

# Google results as at 2011-03-24 #
# 3   for intitle:"Dokeos has not been installed"
# 578 for "Portal Dokeos"

# Dorks #
dorks [
'intitle:"Dokeos has not been installed"',
'"Portal Dokeos"'
]



# Matches #
matches [

# ul id
{ :certainty=>25, :text=>'<ul id="dokeostabs">' },

# HTML Comment
{ :text=>'<!-- start of #main wrapper for #content and #menu divs -->' },

# link tags
{ :certainty=>75, :text=>'<link href="http://www.dokeos.com/documentation.php" rel="Help" />' },
{ :certainty=>75, :text=>'<link href="http://www.dokeos.com/team.php" rel="Author" />' },
{ :certainty=>75, :text=>'<link href="http://www.dokeos.com" rel="Copyright" />' },

# Meta Generator
{ :text=>'<meta name="Generator" content="Dokeos">' },

# Install Page # Title
{ :certainty=>75, :text=>'<title>Dokeos has not been installed</title>' },

# Install Page # Click to Install
{ :regexp=>/<form action="main\/install\/index\.php" method="get"><button class="save" type="submit"[^>]+value="&nbsp;&nbsp; Click to INSTALL (Dokeos|DOKEOS)[\s]+&nbsp;&nbsp;" >Click to INSTALL (Dokeos|DOKEOS)[\s]*<\/button><\/form><br \/>/, :string=>"Install Page" },

# Year Detection # Copyright
{ :string=>/<div class="copyright">[^<]+<a href="http:\/\/www\.dokeos\.com" target="_blank">[\s]*Dokeos [\d\.]*<\/a> &copy; (20[\d]{2})[\s]*<\/div>/ },

# Version Detection # Copyright
{ :version=>/<div class="copyright">[^<]+<a href="http:\/\/www\.dokeos\.com" target="_blank">[\s]*Dokeos ([\d\.]+)<\/a>/ },

# Version Detection # Install Page # Title
{ :version=>/<title>&mdash; Dokeos Installation &mdash; Version ([\d\.]+)<\/title>/, :string=>"Install Page" },

]

end


