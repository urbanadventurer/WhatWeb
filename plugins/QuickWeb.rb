##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QuickWeb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "QuickWeb [Italian]"

# Google results as at 2011-03-24 #
# 52 for -intitle:"QWScript Error" filetype:qws
# 38 for intitle:"QWScript Error" filetype:qws

# Examples #
examples %w|
194.185.194.91
194.185.156.96
www.cuoko.com
www.cuoko.it
ccc.cuoko.it
www.cuoko.net
www.macexchange.it/welcome.qws
www.ipodexchange.it/html/welcome.qws
store.amicidipaco.it/detail.qws
|

# Matches #
matches [

# Error Page # Title
{ :text=>"<HTML><HEAD><TITLE>QWScript Error</TITLE></HEAD>" },

]

end


