##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Umbraco"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-12
  # v0.2 # Updated matches and version detection. 
  "Chad Brigance @ChadBrigance" # 2021-01-09
]
version "0.3"
description "umbraco is an open source project with roots back to year 2000 even though it wasn't released as open source until 2004."
website "http://www.umbraco.org"

# About 24,400 results for "powered by umbraco" @ 2010-06-08
# 27 results for "site powered by umbraco" @ 2010-06-08
# 17 results for "site powered by umbraco v4" @ 2010-06-08

# Dorks #
dorks [
'"site powered by umbraco"'
]



matches [

# GHDB Match
{ :ghdb=>'"powered by umbraco"', :certainty=>25 },

# Meta generator
{ :text=>'<meta name="generator" content="umbraco" />' },

# Powered by text
{ :regexp=>/Powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>Umbraco<\/a>/i },

# Version detection # Powered by text
{ :version=>/powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>umbraco v([^<]+)<\/a>/i },

# Version detection # Powered by text # 4.x
{ :regexp=>/powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>umbraco v4<\/a>/i, :version=>"4.x" },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="umbraco[\s]+([0-9\.]+)"/i },

# CSS Starter Kit
{ :regexp=>/<link rel="stylesheet"[^>]*href="\/css\/umbraco-starterkit-style\.css"/i },

# Javascript Starter Kit
{ :regexp=>/<script src="\/scripts\/umbraco-starterkit-app.js"/i },

# Admin panel Umbraco Title
{ :url=>'/umbraco', :ghdb=>'intitle:Umbraco' },

# Admin panel
{ :url=>'/umbraco', :text=>'<p>For full functionality of Umbraco CMS it is necessary to enable JavaScript.</p>', :name=>'Admin Page' },

# Umbraco logo MD5 match - seen in the official release package for 7.x and 8.x versions
{ :url=>'/umbraco/assets/img/application/logo.png', :md5=>'b7dcca0229da530204697a309c7e6593' }
# Umbraco logo MD5 match - seen in the src code for 7.x and 8.x versions
{ :url=>'/umbraco/assets/img/application/logo.png', :md5=>'26c06a23c7722bbca3e5a9cd55b941d3' }

]

end

