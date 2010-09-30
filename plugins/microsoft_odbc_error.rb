##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "MicrosoftODBCError" do
author "Caleb Anderson"
version "0.1"
description "Microsoft odbc error message"

examples %w| http://www.nutragold.co.nz/main.cfm?id=5843&sid=916&id2=964 http://www.sitefinder.co.nz/entertainment/10/|

matches [
{:name=>"odbc error message'",
:regexp=>/ODBC Error Code = [a-zA-Z0-9]+/ },

]

def passive
	re=/ODBC Error Code = ([a-zA-Z0-9]+)/
	if @body =~ re
		error=@body.scan(re).first.first
	end
    	return [{:name=>"odbc error code",:string=>error}] unless error.nil?
    	return []
end


end


