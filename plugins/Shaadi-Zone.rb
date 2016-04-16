##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Shaadi-Zone" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "Shaadi Zone is the best solution if you are looking to run a matrimonial services services. We have integrated many features which you can use and take full advantage of the matrimonial services. You can run a site like shaadi or bharatmatrimoniy easily."
website "http://www.vastal.com/shaadi-zone-matrimonial-services-script.html"

# 6 results for Powered By Shaadi Zone @ 2010-09-04

# Dorks #
dorks [
'"Powered By Shaadi Zone"'
]



matches [

# Powered by text
{ :text=>"<a href='http://www.vastal.com/' target='_blank'>Powered By Shaadi Zone</a>." },
{ :text=>"Powered By <a href='http://www.vastal.com/' target=\"_blank\">Shaadi Zone</a>" },

]

end

