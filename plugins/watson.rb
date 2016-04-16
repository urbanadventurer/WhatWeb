##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Watson-Router" do
author "Andrew Horton"
version "0.1"
description "Home Router. Default username/password is admin/admin"
website "http://www.schmid-telecom.com/"


matches [
{:text=>"<TITLE>Watson Management Console</TITLE>" },
{:text=>"<!--- Page(page_login)=[Login] ---><HTML>"}
]

end

