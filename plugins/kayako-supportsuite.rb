##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Kayako-SupportSuite"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-09-24
  # v0.2 # 2011-02-24 # Updated version detection. 
  "Andrew Horton", # v0.3 # 2019-12-10 # Added cookie, footer, and version detection for v4.52.x - v4.93.x
]
version "0.3"
description "We offer all of our helpdesk solutions as licensed products (install and host it yourself) or as help desk hosting services."
website "http://www.kayako.com/"

# Google results as at 2010-09-24 #
# 314 for "powered by Kayako eSupport"

# Dorks #
dorks [
'"powered by Kayako eSupport"'
]


# Matches #
matches [

# Cookies
{ :search => "headers[set-cookie]", :text => "SWIFT_client" },

# Default title
{ :text=>' - Powered By Kayako eSupport</title>' },

# Login page # Powered by text
{ :regexp=>/<span class="smalltext"><font color="#333333">Powered by e(Support|SupportSuite)<br\/>Copyright &copy; 2001-[0-9]{4} Kayako Infotech Ltd.<\/font><\/span><br \/>/ },

# Version Detection
{ :version=>/<a href="http:\/\/www.kayako.com" target="_blank">Help Desk Software By Kayako eSupport v([\d\.]+)<\/a>/ },

{ :version=>/<a href="http:\/\/www.kayako.com" target="_blank" title="Help Desk Software">Help Desk Software<\/a>&nbsp;by Kayako SupportSuite v([\d\.]+)/ },

{ :version=>/<td width="144" align="left" valign="top"><span class="smalltext"><font color="#333333">([\d\.]+)<\/font><\/span><\/td>/ },

# Version
{ :version => /SWIFT\.Setup[^}]*"version":"([0-9\.]+)"/ },

# Footer
{ :text => '<div id="bottomfooter" class="bottomfooterpadding"><a href="http://www.kayako.com" target="_blank" class="bottomfooterlink">Help Desk Software"'}
]

end

