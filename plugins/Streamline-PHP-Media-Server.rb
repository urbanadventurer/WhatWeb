##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Streamline-PHP-Media-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-27
version "0.1"
description "Streamline is a streaming media web application written in php."
website "http://streamline.sourceforge.net/about.php"

# 5 results for "A PHP Streaming Media Server" @ 2010-08-27


matches [

# Tagline
{ :text=>'                <div style="font-size: 10pt">A PHP Streaming Media Server</div>' },

# Install page
{ :text=>'    <title>Streamline Media Installation Wizard</title>' },

# Copyright text
{ :text=>'            &copy; 2003-2010 Streamline' },

# Default logo
{ :md5=>'10bf2f9eff6be7d5efd25ce6b70099f4', :url=>'images/streamline.png' }

]

end

