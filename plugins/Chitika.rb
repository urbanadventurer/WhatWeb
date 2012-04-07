##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Chitika" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-07
version "0.1"
description "Chitika Online Advertising Network - Homepage: http://chitika.net/"

# Examples #
examples %w|
www.start-business-today.com
www.elitezoom.com
keithlaney.net
serial4free.webs.com
www.qariya.com
www.youngmic-keytv.com
chestertontribune.com
infodigitalcamera.com
jnlelectronic.com
|

# Matches #
matches [

# JavaScript
{ :regexp=>/<script[^>]+src="http:\/\/scripts\.chitika\.net\/(eminimalls|static)/ },

# JavaScript # Username Detection
{ :account=>/<script type="text\/javascript">\s*ch_client = "([^"]+)";\s*ch_width = \d+;\s*ch_height = \d+;/ },

]

end

