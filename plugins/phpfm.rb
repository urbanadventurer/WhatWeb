##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "PHPFM" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-09
version "0.2"
description "A file manager written in PHP. - homepage:http://www.php-fusion.co.uk/"

# Google results as at 2010-06-09 #
# 36,400 for "powered by PHPFM" -username

# Dorks #
dorks [
'"powered by PHPFM" -username'
]



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/Powered by <a href='http:\/\/phpfm.zalon.dk\/' target='_new' class='bottom'>PHPFM<\/a> ([\d\.]+)<\/td>/ },

]

end

