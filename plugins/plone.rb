##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

#Version 0.2
# remove :certainty=>100

Plugin.define "Plone" do
author "Andrew Horton"
version "0.2"
description "CMS http://plone.org"
examples %w| www.norden.org www.trolltech.com www.plone.net www.smeal.psu.edu|

matches [
{:name=>"meta generator tag",
:regexp=>/<meta name="generator" content="[^>]*http:\/\/plone.org" \/>/},

{:name=>"plone css",
:regexp=>/(@import url|text\/css)[^>]*portal_css\/.*plone.*css(\)|")/}, #"

{:name=>"plone javascript",
:regexp=>/src="[^"]*ploneScripts[0-9]+.js"/}, #"

{:text=>'<div class="visualIcon contenttype-plone-site">'},

{:name=>"div tag, visual-portal-wrapper",
:certainty=>75,
:text=>'<div id="visual-portal-wrapper">'},
]

def passive
	m=[]
	#X-Caching-Rule-Id: plone-content-types
	#X-Cache-Rule: plone-content-types
	m << {:name=>"X-Caching-Rule-Id: plone-content-types" } if @meta["x-caching-rule-id"] =~ /plone-content-types/i
	m << {:name=>"X-Cache-Rule: plone-content-types" } if @meta["x-cache-rule"] =~ /plone-content-types/i
	m
end


end

