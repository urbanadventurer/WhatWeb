##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Atomic-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "Atomic CMS is a powerful and free open source ASP.NET CMS (content management system) developed on ASP.NET MVC 2 platform. Atomic CMS provides you rich user interface to create, edit, remove pages at your website."
website "http://atomiccms.com/"

# Google results as at 2011-03-04 #
# 24 for "Powered by AtomicCms"

# Dorks #
dorks [
'"Powered by AtomicCms"'
]



# Matches #
matches [

# Powered by text
{ :text=>'Powered by AtomicCms <a href="http://atomiccms.com/" target="_blank">content management' },

# Version Detection # Powered by text
{ :version=>/Powered by AtomicCms ([\d\.]{1,15}) <a href="http:\/\/atomiccms.com\/" target="_blank">content management/ },

# favicon.ico
{ :url=>"favicon.ico", :md5=>"9f500a24ccbdda88cf8ae3ec7b61fc40" },

]

end


