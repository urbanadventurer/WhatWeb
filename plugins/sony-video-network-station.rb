##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Sony-Video-Network-Station" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "The Sony SNT-V304 Video Network Station enables video surveillance cameras to be remotely monitored"
website "http://www.sony.com/"
# Manual: http://pdf.textfiles.com/manuals/STARINMANUALS/Sony%20Security/SNT-V304.pdf

# 1 Google result for intitle:"Sony SNT-V304 Video Network Station" inurl:hsrindex.shtml @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1553


matches [

{ :text=>'<TITLE>SONY SNT-V304 Video Network Station</TITLE>', :version=>"SNT-V304" },
{ :text=>'<TITLE>SONY Video Network Station</TITLE>' }

]


end

