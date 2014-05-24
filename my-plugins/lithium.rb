##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Lithium" do
author "Mateusz Golewski"
version "0.1"
description "A Lithium forum engine."
examples %w|http://community.giffgaff.com/|

matches [

{:name=>"BODY id element",
:regexp=>/<body[^>]+id="lia-body"/},

]

end
