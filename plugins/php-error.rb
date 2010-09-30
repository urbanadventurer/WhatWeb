##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty

Plugin.define "PHPError" do
author "Andrew Horton"
version "0.2"
description "PHP errors"

examples %w| www.orodinapoli.it www.surfpix.co.nz|

matches [
{:name=>"php error",
:regexp=>/<b>(Warning|Fatal error)<\/b>: .*on line <b>[0-9]+<\/b><br \/>/ }
]

# return filepaths that end in .inc :) -- source disclosure
#def passive
#	m={}
#	
#	if @body.scan(/<b>(Warning|Fatal error)<\/b>: .*([^ ]+\.inc) on line <b>[0-9]+<\/b><br \/>/)
#		inc=@body.scan(/<b>(Warning|Fatal error)<\/b>: .*([^ ]+\.inc) on line <b>[0-9]+<\/b><br \/>/)[0][1]
#	end
#	m
#end

end


