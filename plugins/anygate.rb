# coding: ascii-8bit
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "AnyGate" do
author "Andrew Horton"
version "0.1"
description "Korean home wifi/router device"
website "http://www.anygate.co.kr/"


matches [
{:url=>'/index.asp', :text=>'<title>AnyGate' },
{:url=>'/index.asp', :text=>"사용자 암호가 설정되어 있지 않습니다.",  :string=>"No Password"}
]

end

