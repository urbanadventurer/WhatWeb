##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "DublinCore" do
author "Caleb Anderson"
version "0.1"
description "Dublin core"

examples %w| newzealand.govt.nz www.direct.gov.uk|

matches [
{:name=>"dublin core",
:regexp=>/<meta [^>]*name="DC\.title".*?>/i},

]


end


