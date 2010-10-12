# -*- coding: utf-8 -*-
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 by Andrew Horton
# removed VIEWSTATE match as it matches ASP.NET, removed :probability=>100

Plugin.define "EPiServer" do
author "Patrik Wallström"
version "0.2"
description "CMS from EPiServer - http://episerver.com/"

examples %w| www.stockholm.se www.sweden.se www.fritidsresor.se|

matches [
{:name=>"meta generator tag with EPiServer", 
:text=>"<meta name=\"GENERATOR\" content=\"EPiServer\" />"},

{:name=>"EPiServer comment", 
:text=>"<!-- EPiServer -->"}

]


end

