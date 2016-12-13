##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QR-Code-Panel" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-18
version "0.1"
description "QR-Code Panel for PHP-Fusion"
website "http://www.g0lgs.co.uk/downloads.php"

# Google results as at 2011-08-18 #
# 37 for "QR-Code Panel" "by G0LGS"

# Dorks #
dorks [
'"QR-Code Panel" "by G0LGS"'
]



# Matches #
matches [

# Version Detection
{ :version=>/<tr><td width='100%' align='center' class='small'>QR-Code Panel<a title='V[^\s^<]+ \([\d]{2}\/[\d]{2}\/[\d]{4}\)'> V([^\s^<]+)<\/a><br \/>/ },

# Software link
{ :certainty=>75, :regexp=>/&copy; [\d]{4} by <a href='http:\/\/www\.g0lgs\.co\.uk\/downloads\.php'>G0LGS<\/a><\/td><\/tr>/ },

]

end

