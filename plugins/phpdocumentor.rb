##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpDocumentor" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-20
version "0.1"
description "phpDocumentor, sometimes referred to as phpdoc or phpdocu, is the current standard auto-documentation tool for the php language. Similar to Javadoc, and written in php, phpDocumentor can be used from the command line or a web interface to create professional documentation from php source code."

# Google results as at 2011-05-20 #
# 10 for intitle:"docBuilder - phpDocumentor web interface"
#  8 for intitle:"docBuilder - phpDocumentor web interface" -svn

# Dorks #
dorks [
'intitle:"docBuilder - phpDocumentor web interface"'
]



# Matches #
matches [

# Default title
{ :certainty=>75, :text=>'<title>docBuilder - phpDocumentor web interface</title>' },

# Frameset # Meta Description
# Note the "phpDcoumentor" typo # several websites used this meta description
# It does not seem to be unique to a particular version
{ :text=>'<meta name="Description" content="Frameset for phpDcoumentor docBuilder web interface">' },

# Frameset # Meta Description
{ :text=>'<meta name="Description" content="Frameset for phpDocumentor docBuilder web interface">' },

# docbuilder/actions.php # extract local file path
{ :filepath=>/<input type="text" name="fileName" value="([^"]+)" size="60" class="text" \/>/ },

# docbuilder/config.php # Version Detection # title
{ :version=>/	<title>\n		Form to submit to phpDocumentor v([^\s]+)	<\/title>/ },

# docbuilder/top.php # Version Detection
{ :version=>/<span class="title"><strong>docBuilder<\/strong> :: phpDocumentor v([^\s]+) Web Interface<\/span>/ },

]

end

# An aggressive plugin could use:
#	docbuilder/actions.php
#	docbuilder/config.php
# for version and local file path detection

