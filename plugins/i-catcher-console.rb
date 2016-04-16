##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "i-Catcher-Console" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.2"
description "i-Catcher is a Digital CCTV system for security, surveillance and remote monitoring applications."
website "http://www.icode.co.uk/icatcher/"

# Google results as at 2010-07-20 #
# 22 for "please visit" intitle:"i-Catcher Console" Copyright "iCode Systems"

# ShodanHQ results as at 2010-07-20 #
# 189 for Server:i-Catcher Console



# Matches #
matches [

# Default JavaScript Comment
{ :text=>'   // These vars will be filled in by i-Catcher Console' },

# Default Title
{ :text=>' <title>i-Catcher Console - Live view</title>' },

# Copyright Text
{ :regexp=>/     i-Catcher Console is Copyright [\d]{4}-[\d]{4} <a[^>]+href="http:\/\/www.icode.co.uk\/">iCode Systems<\/a>./ },

# Version Detection # Copyright Footer
{ :version=>/     i-Catcher Console ([\d\.]+) is Copyright [\d]{4}-[\d]{4} <a class="footer" href="http:\/\/www.icode.co.uk\/">iCode Systems<\/a>./ },

]

end

