##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpVMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-25
version "0.1"
description "phpVMS is apparently the most popular, free, virtual airline software, with support for various ACARS applications (kACARS, FSACARS, XAcars, FS Flight Keeper, and FSPassengers)"
website "http://www.phpvms.net/"

# Google results as at 2011-08-25 #
# 235 for "powered by phpVMS" inurl:"index.php/registration"
#   5 for intitle:"phpVMS Installer" "Welcome to the phpVMS installer"

# Dorks #
dorks [
'"powered by phpVMS" inurl:"index.php/registration"'
]



# Matches #
matches [

# div class="jqmWindow" id="jqmdialog"
{ :certainty=>75, :text=>'<div class="jqmWindow" id="jqmdialog"></div>' },

# Version Detection # Install Page # ./install/install.php
{ :version=>/<a href="http:\/\/www\.phpvms\.net\/docs\/license">License & About<\/a> \|[\s]+Version ([^\s]+)[\s]+<\/div>/ },

# HTML Comment
{ :regexp=>/<!-- Please retain this!! It's part of the phpVMS license\. You must display a[\s]+"powered by phpVMS" somewhere on your page\. Thanks! -->/ },

# Powered by link
{ :text=>'<a href="http://www.phpvms.net" target="_blank">powered by phpVMS</a>' },

]

end

