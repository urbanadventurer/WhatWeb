##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Len" do
author "Andrew Horton"
version "0.1"
description "The length of the HTML body"


def passive
	[{:string=>@body.size}]
end

end

