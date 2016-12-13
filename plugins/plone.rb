##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# remove :certainty=>100
##
Plugin.define "Plone" do
author "Andrew Horton"
version "0.2"
description "Plone Content Management System (CMS)"
website "http://plone.org"



# Dorks #
dorks [
'"powered by plone"',
'inurl:"acl_users/credentials_cookie_auth/require_login?came_from"'
]

# Matches #
matches [

# URL Pattern
{ :name=>"URL Pattern", :certainty=>75, :ghdb=>'inurl:"acl_users/credentials_cookie_auth/require_login?came_from"' },

# Meta Generator
{:name=>"meta generator tag",
:regexp=>/<meta name="generator" content="[^>]*http:\/\/plone.org" \/>/},

# StyleSheet HTML
{:name=>"plone css",
:regexp=>/(@import url|text\/css)[^>]*portal_css\/.*plone.*css(\)|")/}, #"

# JavaScript
{:name=>"plone javascript",
:regexp=>/src="[^"]*ploneScripts[0-9]+.js"/}, #"

# <div class="visualIcon contenttype-plone-site">
{:text=>'<div class="visualIcon contenttype-plone-site">'},

# <div id="visual-portal-wrapper">
{:name=>"div tag, visual-portal-wrapper",
:certainty=>75,
:text=>'<div id="visual-portal-wrapper">'},

# X-Caching-Rule-Id: plone-content-types
{ :name=>"X-Caching-Rule-Id: plone-content-types", :search=>"headers[x-caching-rule-id]", :regexp=>/plone-content-types/i },

# X-Cache-Rule: plone-content-types
{ :name=>"X-Cache-Rule: plone-content-types", :search=>"headers[x-cache-rule]", :regexp=>/plone-content-types/i },

]

end

