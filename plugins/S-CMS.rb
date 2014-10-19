# coding: ascii-8bit
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
##
# Version 0.3 # 2011-02-25 #
# Updated powered by match
##
Plugin.define "S-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.3"
description "CMS"
website "http://www.matteoiammarrone.com/public/s-cms/"

# Google results as at 2010-08-30 #
# 8 for "powered by S-CMS"



# Matches #
matches [

# Powered by text
{ :text=>'<p class="alignRight">Powered by S:CMS - Copyright ©' },

# Admin Page # Default Title
{ :text=>'<title>SCMS</title>' },

# HTML comment - translated: Top row indexing in search engines
{ :text=>'<!-- Inizio righe di indicizzazione nei motori di ricerca -->' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href='http:\/\/www.matteoiammarrone.com\/public\/s-cms' target='_blank'>S-Cms ([\d\.]+)<\/a>/ },

]

end

