##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Len"
authors [
  "Andrew Horton",
]
version "0.1"
description "The length of the HTML body"


passive do
	[{:string=>@body.size}]
end

end

