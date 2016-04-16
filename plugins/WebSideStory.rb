##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebSideStory" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "On-Demand Web Analytics For Optimizing Online Business Performance
HBX Analytics service is a comprehensive on-demand web analytics solution, delivering up-to-the second insight into online visitor and customer behavior."
website "http://www.websidestory.com/"

# 25 results for "powered by WEBSIDESTORY" @ 2010-10-14


matches [

# HTML comments
{ :text=>'<!-- WebSideStory HTML for Search -->' },
{ :text=>'<!--END WEBSIDESTORY CODE-->' },
{ :regexp=>/<!--COPYRIGHT 1997-[0-9]{4} WEBSIDESTORY,INC. ALL RIGHTS RESERVED. U.S.PATENT No. 6,393,479B1. MORE INFO:http:\/\/websidestory.com\/privacy-->/ },

# Version detection # HTML comments
{ :version=>/<!--WEBSIDESTORY CODE ([^\ ]+) / },

# Powered by text

{ :text=>'Search powered by <a class="external" href="http://www.websidestory.com/">WebSideStory</a>' },
{ :text=>'<a href="http://websidestory.com/" target="_blank">Powered by WebSideStory</a>' },

]

end

