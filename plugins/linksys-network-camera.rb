##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.1"
description "Linksys network camera web interface - homepage: http://www.linksys.com/"

# 14 Google results for inurl:/img/main.cgi inurl:next_file @ 2010-07-22
examples %w|
189.254.227.7
216.167.184.100:6360
24.226.195.125
|

matches [

{ :text=>'<meta name="description" content="WVC54GCA">', :version=>"WVC54GCA" },

{ :text=>'<td bgcolor="#6766CC" align="right" valign="top"><span class="model" style="position:relative;top:-12px">WVC54GCA</span><img src="../blue_top_right.gif" alt="" border="0">', :version=>"WVC54GCA" },

{ :text=>'<meta name="description" content="WVC80N">', :version=>"WVC80N" },

{ :text=>'<td bgcolor="#6766CC" align="right" valign="top"><span class="model" style="position:relative;top:-12px">WVC80N</span><img src="../blue_top_right.gif" alt="" border="0">', :version=>"WVC80N" },

]


end

