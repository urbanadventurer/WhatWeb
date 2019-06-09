##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Kentico-CMS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-04
  # v0.2 # Added 3 cookies. Added admin page link.. 
]
version "0.2"
description "Kentico CMS for ASP.NET - flexible, all-in-one solution for web developers"
website "http://www.kentico.com/"

# ShodanHQ results as at 2013-02-06 #
# 384 for CMSPreferredCulture

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<\/title><meta name="generator" content="Kentico CMS [^\(^>]{1,5} \(build ([\d\.]{1,10})\) [^"^>]*" \/>/ },

{ :regexp => /2fCMSAdministration.aspx" id="form1" class="logon-page"/, :name => "Admin-Login-Page",  :certainty=>100},

# Cookie 
{ :search => "headers[set-cookie]", :regexp => /CMSCsrfCookie/, :name=>"CMSCsrfCookie cookie" },
{ :search => "headers[set-cookie]", :regexp => /CMSCurrentTheme/, :name=>"CMSCurrentTheme cookie" },
{ :search => "headers[set-cookie]", :regexp => /CMSPreferredCulture/, :name=>"CMSPreferredCulture cookie" },
{ :search => "headers[set-cookie]", :regexp => /CMSCsrfCookie/, :name=>"CMSCsrfCookie cookie" },

]

end


