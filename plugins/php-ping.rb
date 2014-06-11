##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex
##
Plugin.define "php-ping" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.2"
description "php-ping - PHP powered ping web interface."

# About 184 results for "Enter ip" inurl:"php-ping.php" @ 2010-06-13


matches [

# GHDB Match
{ :ghdb=>'"Enter ip" inurl:"php-ping.php"', :certainty=>75 },

# Default form HTML
{ :regexp=>/<form methode="post" action="[^>]*>[\s]*Enter IP or Host[^<]*<[^<]*type="text" name="host" value="[\d\.]*"><\/input>[\s]*Enter Count[^>]*name="count" size="2" value="4"><\/input>[^>]*[\s]*<input type="submit"[^>]*name="submit" value="Ping!"><\/input><\/form><br><b><\/b>/ },

]

end

