##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "AdobeFlash" do
author "Caleb Anderson"
version "0.1"
description "Embedded adobe flash detection"

examples %w|www.myspace.co.nz www.pizzahut.co.nz|

matches [
{:name=>"embedded flash",
:regexp=>/<object.*?>*?application\/x-shockwave-flash.*?<\/object>/im
},

]



end


