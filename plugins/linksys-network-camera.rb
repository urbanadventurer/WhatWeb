##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Changed :version to :model
##
Plugin.define "Linksys-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-22
version "0.2"
description "Linksys network camera web interface"
website "http://www.linksys.com/"

# 14 Google results for inurl:/img/main.cgi inurl:next_file @ 2010-07-22

# Dorks #
dorks [
'inurl:/img/main.cgi inurl:next_file'
]



matches [

# WVC54GCA # Meta description
{ :text=>'<meta name="description" content="WVC54GCA">', :model=>"WVC54GCA" },

# WVC54GCA # Default logo HTML
{ :text=>'<td bgcolor="#6766CC" align="right" valign="top"><span class="model" style="position:relative;top:-12px">WVC54GCA</span><img src="../blue_top_right.gif" alt="" border="0">', :model=>"WVC54GCA" },

# WVC80N # Meta description
{ :text=>'<meta name="description" content="WVC80N">', :model=>"WVC80N" },

# WVC80N # Default logo HTML
{ :text=>'<td bgcolor="#6766CC" align="right" valign="top"><span class="model" style="position:relative;top:-12px">WVC80N</span><img src="../blue_top_right.gif" alt="" border="0">', :model=>"WVC80N" },

]


end

