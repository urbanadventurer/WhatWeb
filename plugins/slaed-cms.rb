##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SLAED-CMS"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-09-12
  "Andrew Horton", # v0.2 # 2019-07-10 # Added website field.
  "Eduard Laas", # v0.3 # 2026-11-20 # Added SLAED CMS 8 and Open SLAED detection.
]
version "0.3"
description ""
website "https://slaed.net/"

# Google results as at 2011-09-12 #
# 268 for "Powered by SLAED CMS"

# Dorks #
dorks [
'"Powered by SLAED CMS"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="SLAED CMS ([^"^>]+)">/ },

# Meta Generator without version # SLAED CMS 8+
{ :text=>'<meta name="generator" content="SLAED CMS">' },

# CSRF token meta tag # SLAED CMS 8+
{ :text=>'<meta name="sl-token" content="' },

# Core JavaScript # SLAED CMS 8+
{ :regexp=>/<script[^>]+src="[^"]*\/plugins\/system\/slaed\.js/ },

# Open SLAED edition # Meta Generator
{ :regexp=>/<meta name="generator" content="Open SLAED/ },

# Open SLAED edition # Powered by text
{ :text=>'title="Open SLAED">Open SLAED</a>' },

# Year Detection # Powered by text
{ :string=>/<br \/>Powered by <a href="http:\/\/www\.slaed\.net" target="_blank" title="SLAED CMS">SLAED CMS<\/a> &copy; 2005-(20[\d]{2}) SLAED/ },

]

end

