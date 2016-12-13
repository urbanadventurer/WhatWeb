##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iScripts-ReserveLogic" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "iScripts ReserveLogic offers an online web based reservation system for the hospitality industry for service providers."
website "http://www.iscripts.com/reservelogic/"

# 10 results for "powered by iScripts ReserveLogic" @ 2010-07-11

# Dorks #
dorks [
'"powered by iScripts ReserveLogic"'
]



matches [

{ :text=>'Powered by <a href="http://www.iscripts.com/reservelogic/" target="_blank">iScripts ReserveLogic</a> . A premium product from <a href="http://www.iscripts.com" target="_blank">iScripts.com</a></td>' },

]


end

