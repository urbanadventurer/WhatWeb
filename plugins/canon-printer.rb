##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Canon-Printer" do
author "Andrew Horton"
version "0.1"
description "Remote UI for Canon Printers. Homepage: www.canon.com"
examples %w| 124.186.130.214 220.227.144.157|

# each model needs a different match

matches [
{:model=>/<title>Remote UI<Top Page>: (\w+)/i}, # iR2018i
{:model=>/<title>Remote UI&lt;Top page&gt;: ([^:]+)/i, :url=>"/frame.cgi"}, # iR C3220
{:model=>/<title>Remote UI&lt;Top page&gt;: ([^:]+)/i, :url=>"/frame.cgi?PageFlag=t_frame.tpl"}, # iR2870
{:text=>'<img src="top_canon.gif" width="123" height="33"', :url=>"_top.htm"}
]

def passive
	m=[]
	unless @meta["server"].nil?
		m << { :string=>"Server header" } if @meta["server"] =~ (/^Canon Http Server/i)
		m << { :version=>@meta["server"].scan(/Canon Http Server (.*)/i) } if @meta["server"] =~ (/Canon Http Server (.*)/i)
	end
	m
end

end

