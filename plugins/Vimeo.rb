##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Vimeo" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "Vimeo.com video player - Homepage: http://vimeo.com/"

# Examples #
examples %w|
rarelyunable.com
townesharvest.montana.edu/video.htm
motorbiketv.info/video/sbk/mss-zx-10r-on-board-lap-around-portimao/
motor-sport.tv/video/drifting/amf---maple-leaf-bash---deal-with-it-july-3031/
itweb.tv/video/community/aurora-borealis-timelapse-troms-2010/
|

# Matches #
matches [

# param|embed|object Source
{ :regexp=>/<(param|object|embed) [^>]+vimeo\.com\/moogaloop/i },

]

end


