##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "TVersity" do
author "Andrew Horton"
version "0.1"
description "The TVersity Media Server lets you manage your Internet and home media. Homepage: tversity.com"


matches [
{:md5=>"300b5c3f134d7ec0bca862cf113149d8", :url=>"/favicon.ico" }
]

def passive
	if @headers["server"] =~ /TVersity Media Server/
		if @headers["server"] =~ /TVersity Media Server\/([\d\.]+)/
			v=@headers["server"].scan(/TVersity Media Server\/([\d\.]+)/).first
			[{:name=>"server header", :version=>v}]
		else
			[{:name=>"server header"}]
		end
	else
		[]
	end
end

end

