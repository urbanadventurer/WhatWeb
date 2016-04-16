##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-21 #
# Updated version detection
##
Plugin.define "Traidnt-UP" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.2"
description "Traidnt UP"
website "http://www.traidnt.net"

# Google results as at 2010-09-26 #
# 470 for "powered by Traidnt UP Version"

# Dorks #
dorks [
'"powered by Traidnt UP Version"'
]



# Matches #
matches [

# HTML comment
{ :text=>'<!-- # START HEDARE -->' },

# Powered by link HTML
{ :text=>"<font color='#000080'><a href='http://traidnt.net' target='_blank'>" },
# Powered by text
{ :text=>"			<span style='text-decoration: none'><font color='#000000'>Traidnt&nbsp;UP</font></span></a></font></span></b>" },

# Version Detection # Powered by text
{ :version=>/<p align='center' dir='ltr'>Powered by Traidnt UP Version ([\d\.]+)<\/p>/ },

# Version Detection # Powered by text
{ :version=>/<div class="footer">Powered by <a href="http:\/\/traidnt.net" target="_blank">TRAIDNT UP<\/a> Version ([\d\.]+)[\s]*<\/div>/ },

# Version Detection # Default HTML + whitespate format
{:version=>/			<span style='text-decoration: none'><font color='#000000'>Traidnt&nbsp;UP<\/font><\/span><\/a><\/font><\/span><\/b>[\r\n]{2}			Version ([\d\.]+)<\/p>/ },

]

end

