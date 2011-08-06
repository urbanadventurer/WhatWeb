##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# added - unless @ip.empty?

Plugin.define "IP" do
author "Andrew Horton"
version "0.2"
description "IP address of the target, if available."

def passive
m=[]

m << {:string=>@ip } unless @ip.nil? or @ip.empty?
m
end

end

