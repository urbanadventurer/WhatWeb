##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "w-agora" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "w-agora is web based forum package. It is entirely customizable through a web browser. It allows web publishing and file upload."
website ""

# Google results as at 2011-02-27 #
# 57 for inurl:"w-agora" ext:php3



# Matches #
matches [

# GHDB Match
{ :certainty=>25, :ghdb=>'inurl:"w-agora" ext:php3' },

# Install Page
{ :text=>"<CAPTION><B>System Administrator's Informations (login : <u>admin</u>)</B></CAPTION>" },

# Version Detection # Meta Generator
{ :version=>/<META NAME="GENERATOR" Content="w-agora version ([\d\.]+)"[\/]?>/i },

# Error Message
{ :text=>'<table border bgcolor="#eeeeee" align="center" cellspacing=0 cellpadding=5 width=400><tr><td align=center><font face="Arial, Verdana" color="#FF2020">Cannot access configuration file: ./conf/site_agora.php3</td></tr></table>' },

]

end


