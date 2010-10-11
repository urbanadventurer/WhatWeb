##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "LifeType" do
author "Aung Khant, http://yehg.net"
version "0.1"
description "LifeType is an open-source blogging platform with support for multiple blogs and users in a single installation."

examples=%w|
http://demo.opensourcecms.com/lifetype/
|	

# <meta name="generator" content="lifetype-1.2.10_r6971" />

matches [
{:name=>"poweredBy", :text=>'Powered by <a href="http://www.lifetype.net">LifeType</a>'},
{:url=>'summary.php?op=resetPasswordForm',:text=>'Powered by <a href="http://www.lifetype.net">LifeType</a>'},
{:url=>'summary.php?op=resetPasswordForm',:text=>'<title>Your Service Name</title>'},
{:version=>/<meta name=\"generator\" content=\"(lifetype\-)?(lifetype-?[0-9\.\_a-z]+)\"/, :version_regexp_offset=>1},
]


end





