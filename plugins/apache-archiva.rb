##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache-Archiva" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Apache Archiva is an extensible repository management software that helps taking care of your own personal or enterprise-wide build artifact repository. It is the perfect companion for build tools such as Maven, Continuum, and ANT."
website "http://archiva.apache.org/"

# Google results as at 2011-06-01 #
# 29 for intitle:"Apache Archiva" ext:action "Copyright"

# Dorks #
dorks [
'intitle:"Apache Archiva" ext:action "Copyright"'
]



# Matches #
matches [

# Title
{ :certainty=>25, :text=>'<title>Apache Archiva \\' },

# 404 Page
{ :text=>'No context on this server matched or handled this request.<BR>Contexts known to this server are: <ul><li><a href="/archiva">/archiva&nbsp;--->&nbsp;org.mortbay.jetty.webapp.WebAppContext' },

# Search form
{ :text=>'<form namespace="/" id="quickSearch" name="quickSearch" onsubmit="customOnsubmit_quickSearch(); return validateForm_quickSearch();" action="' },
{ :text=>'<form namespace="/" id="quickSearch" name="quickSearch" onsubmit="return validateForm_quickSearch();" action="' },

# Version Detection # Footer
{ :version=>/<div class="xleft">\s+<a target="_blank" href="http:\/\/archiva\.apache\.org\/">Apache Archiva ([\d\.]+)<\/a>\s+<\/div>\s+<div class="xright">/ },
{ :version=>/<div class="xleft">\s+Apache Archiva ([\d\.]+)\s+<\/div>\s+<div class="xright">/ },

]

end

