##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "jCore" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-10-22
version "0.1"
description "jCore is a free and open source content management system (CMS) written in PHP and distributed under the GNU General Public License."
website "http://jcore.net/about"

# Google results as at 2012-10-22 #
# 22 for intitle:"Admin - jCore - the Webmaster's Multisite CMS"
#  7 for inurl:"members?requestpassword=1"

# Dorks #
dorks [
'intitle:"Admin - jCore - the Webmaster\'s Multisite CMS"'
]



# Matches #
matches [

# JavaScript # Version Detection
{ :version=>/<script type='text\/javascript'>\s+var JCORE_VERSION = '([^']+)';/ },

# CSS # Version Detection
{ :version=>/<link href='https?:\/\/[^'^\?]+\/static\.php\?request=css(&amp;admin=1)?&amp;[\d]+\-v([\d\.]+)/, :offset=>1 },

]

end

