##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CGI-Backdoor" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-19
version "0.1"
description "Simple CGI backdoor by DK (http://michaeldaw.org)"



# Matches #
matches [

{ :text=>'<html><body><!-- Simple CGI backdoor by DK (http://michaeldaw.org) --><b style="color:black;background-color:#ffff66">Usage</b>: http://target.com/perlcmd.cgi?cat /etc/passwd<pre></pre></body></html>', :string=>'Simple CGI backdoor by DK (http://michaeldaw.org)' },

]

end

