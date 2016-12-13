##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OurDisclaimer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "OurDisclaimer.com - Third party disclaimer service."
website "http://ourdisclaimer.com/"

# 59 results for inurl:"ourdisclaimer.com/?i=" @ 2010-10-14


matches [

# Get URL # Link & Image method
{ :version=>/<a[^>]+href[\s]*=[\s]*"http:\/\/ourdisclaimer.com\/\?i=([^\"]+)/i },

# Get URL # Iframe method
{ :version=>/<iframe[^>]+src[\s]*=[\s]*"http:\/\/ourdisclaimer.com\/\?i=([^\"]+)/i },

]

end

