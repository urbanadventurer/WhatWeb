# -*- coding: utf-8 -*-
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EPiServer" do
author "Patrik Wallström"
version "0.1"
description "CMS from EPiServer - http://episerver.com/"

examples %w| www.stockholm.se www.sweden.se www.fritidsresor.se|

# identifying strings
# <meta name="GENERATOR" content="EPiServer" /> 
# <!-- EPiServer -->
# <input type="hidden" name="__VIEWSTATE" value=

matches [
{:name=>"meta generator tag with EPiServer", 
:probability=>100,
:text=>"<meta name=\"GENERATOR\" content=\"EPiServer\" />"},

{:name=>"EPiServer comment", 
:probability=>100,
:text=>"<!-- EPiServer -->"},

{:name=>"using __VIEWSTATE",
:probability=>100,
:text=>"<input type=\"hidden\" name=\"__VIEWSTATE\" id=\"__VIEWSTATE\" value=\""}

]


end

