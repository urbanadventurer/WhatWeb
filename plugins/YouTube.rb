##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "YouTube" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-16
version "0.1"
description "Embedded YouTube video - Homepage: http://youtube.com/"

# Examples #
examples %w|
neworder.box.sk
screplayvideos.com/2010/12/03/tvp-vs-carriers-12/
|

# Matches #
matches [

# param|object Source
{ :regexp=>/<(param|embed) [^>]*youtube\.com\/v/i },

]

end


