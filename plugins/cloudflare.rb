##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-05-10
# David P Robinson <david@intruder.io>
# Added regex to detect CloudFlare email address protection feature
##
##
# Version 0.2 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
# Change plugin name captilization
##
Plugin.define "CloudFlare" do
author "Aung Khant <http://yehg.net/> & David P Robinson <david@intruder.io>" # 2011-02-04
version "0.3"
description "CloudFlare is a content delivery network. Its features include DDoS protection and Web Application Firewall functionality"
website "https://www.cloudflare.com/"

# Google results as at 2011-04-12 #
# 14 for "Performance & Security by Cloudflare"

# Dorks #
dorks [
'"Performance & Security by Cloudflare"'
]



# Matches #
matches [

{:name => 'access restricted iframe', :text => '<iframe frameborder="0" width="100%" height="100%" src="http://anti-virus.cloudflare.com/cdn-cgi/anti-virus-challenge?h='},

{:name => 'footer', :text => '&nbsp;&nbsp;Performance &amp; Security by <a id="FooterCloudFlare" href="https://www.cloudflare.com" target="_blank">CloudFlare</a>'},

{:search=>"headers[server]", :regexp => /cloudflare\-nginx/, :name=>"server header" },

{:search=>"headers[set-cookie]", :regexp => /__cfduid/, :name=>"__cfduid cookie" },

{:name => "email address protection", :regexp => /\/cdn-cgi\/l\/email-protection#[a-f0-9]{36}/ }

]

end
