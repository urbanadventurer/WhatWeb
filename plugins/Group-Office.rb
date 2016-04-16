##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-10-08 #
# Added version detection
# Added 'groupoffice' cookie match
##
Plugin.define "Group-Office" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Share projects, calendars, files and e-mail online with co-workers and clients. Easy to use and fully customizable, Group-Office takes online collaboration to the next level."
website "http://www.group-office.com/"

# ShodanHQ results as at 2012-10-08 #
# 309 for groupoffice

# Google results as at 2012-10-08 #
# 239 for "Powered by Group-Office" "Copyright" "Intermesh" "2003"

# Dorks #
dorks [
'"Powered by Group-Office" "Copyright" "Intermesh" "2003"'
]



# Matches #
matches [

# groupoffice Cookie
{ :search=>"headers[set-cookie]", :regexp=>/groupoffice=[^;]+;/ },

# ./index.php # Login Page # JavaScript # Version Detection
{ :version=>/GO\.settings=\{[^\}]+"theme":"[^"]+","product_name":"Group-Office","product_version":"([^"^\s]+)","host":"/ },

# ./themes/Default/images/favicon.ico # Default favicon
{ :md5=>"6cbe55dd826fe9e2e4306d5a5672382f", :url=>'themes/Default/images/favicon.ico' },

# HTML comment
{ :text=>'<!-- include everything after the loading indicator -->' },

# Meta description
{ :text=>'<meta name="description" content="Take your office online. Share projects, calendars, files and e-mail online with co-workers and clients. Easy to use and fully customizable, Group-Office takes online colaboration to the next level." />.' },

# Powered by text
{ :text=>'<a style="color: white;" target="_blank" href="http://www.group-office.com">powered by Group-Office</a>' },
{ :text=>'Powered by Group-Office: <a target="_blank" class="normal-link" href="http://www.group-office.com">http://www.group-office.com</a>' },

# Default Javascript
{ :text=>"alert('The Group-Office javascripts were not loaded. Check the host property in config.php and see if the file_storage_path folder and it\\'s contents are writable');" },
{ :text=>"alert('Could not load the application javascripts. Check the \"host\" property in config.php and see if the \"file_storage_path\" folder and it\\'s contents are writable');" },

]

end

