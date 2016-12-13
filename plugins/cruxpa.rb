##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CruxPA" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.1"
description "CruxPA - Simple, easy to use task list/CRM"
website "http://www.cruxsoftware.co.uk/"

# Dorks #
dorks [
'"Powered By CruxPA"'
]



# Matches #
matches [

{:text=>'<div id="copy"><center>Powered By <a href="http://www.cruxsoftware.co.uk">CruxPA</a><br>' },

]

end

