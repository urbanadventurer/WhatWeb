##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Splunk" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-17
version "0.1"
description "Splunk indexes and makes searchable data from any app, server or network device in real time including logs, config files, messages, alerts, scripts and metrics."
website "http://www.splunk.com"

# ShodanHQ results as at 2011-04-17 #
# 18 for session_id_8000

# Google results as at 2012-04-17 #
# 29 for intitle:"Login - Splunk" "If you've forgotten your username or password, please contact your Splunk"

# Dorks #
dorks [
'intitle:"Login - Splunk" "If you\'ve forgotten your username or password, please contact your Splunk"'
]



# Matches #
matches [

# Footer # Version Detection
{ :version=>/<p class="footer">&copy; 2005-20[\d]{2} Splunk Inc\. Splunk ([^<]+)\.<\/p>/ },

# Forgot your password text
{ :text=>"<p><span>First time logging in?</span> Splunk's default credentials are </p><p>username: <span>admin</span><br />password: <span>changeme</span></p><p>If you've forgotten your username or password, please contact your Splunk administrator.</p>" },

# session_id_8000 Cookie
{ :search=>"headers[set-cookie]", :regexp=>/session_id_8000=[a-f\d]{32};/ },

# Meta Author
{ :certainty=>75, :text=>'<meta name="author" content="Splunk Inc." />' },

# /en-US/favicon.ico
{ :url=>"/en-US/favicon.ico", :md5=>"f7728520c81b7a303d8e54d282e13a16" },

# JavaScript # Install Type
{ :string=>/var CONFIG = \{"licenseType": "[^\"]+", "os_name": "[^"]+", "locale":[^\}]+"installType": "([^"]+)"/ },

# JavaScript # OS Detection
{ :os=>/var CONFIG = \{"licenseType": "[^\"]+", "os_name": "([^"]+)", "locale":/ },

]

end

