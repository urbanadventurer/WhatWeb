##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenDocMan" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-08-26
version "0.1"
description "OpenDocMan - Open Source Document Management System - Requires PHP - Homepage: http://www.opendocman.com/"

# Google results as at 2012-08-26 #
# 29 for "OpenDocMan" "Stephen Lawrence" intitle:"Document Repository"

# Dorks #
dorks [
'"OpenDocMan" "Stephen Lawrence" intitle:"Document Repository"'
]

# Examples #
examples %w|
www.opendocman.com/demo_126/
www.dellco.ac.me/opendocman/
www.uta.edu/mpcwic/opendocman/
www.craigncraigprofrealty.com/docs/
www.crownhr.co.uk/dms/
tillp.co.uk/sites/collaborate/opendocman-1.2.5.7/
doc.teravera.ph
www.cnpc-nile.com/opendocman/
elixir.dyndns.org/dms/
ghumc.dnsalias.org:8081/doc_man/index.php
www.heidekreis-musikschule.de/opendocman/
dedemiinterior.com/opendocman/
papeleriala96.com/docs/
https://lenkens.net/dms/
https://agrilife-smp.tamu.edu/
|

# Matches #
matches [

# Version Detection
{ :version=>/<a href="http:\/\/www\.opendocman\.com\/" target="_new">OpenDocMan v([^"^\s]+)<\/a>/ },

# Logo HTML
{ :text=>'<td align="left"><img src="images/logo.gif" alt="Site Logo" border=0></td>' },

# Welcome text
{ :regexp=>/<td valign="top">\s+Welcome to OpenDocMan\.?\s+<p>/ },

]

end

