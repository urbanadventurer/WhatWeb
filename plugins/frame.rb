##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Frame" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-13
version "0.1"
description "This plugin detects instances of frame and iframe HTML elements and grabs the URL."

# 213 results for "your browser does not support frames" @ 2010-10-13
examples %w|
crowd.webhop.org
fleckerika.sytes.net
frenchtownalive.com
movies.sky.com
tv.sky.com
bricktech.blogspot.com
livestreamingofsoccer.blogspot.com
www.dialogclassic.com
www.nasa.gov/externalflash/name_ISS/
www.ornatopia.com
www.usbornebooksandmore.com/?NewID=NEW
|

matches [

# URL Extraction
{ :version=>/<[\s]*[i]*frame[^src]+src[\s]*=[\s]*[\"|\']*([^>^\"]+)/i, :version_regexp_offset=>0 },

]

end

