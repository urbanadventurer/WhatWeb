##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MooTools" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-02
version "0.1"
description "MooTools is a compact, modular, Object-Oriented JavaScript framework designed for the intermediate to advanced JavaScript developer. It allows you to write powerful, flexible, and cross-browser code with its elegant, well documented, and coherent API. - homepage: http://mootools.net/"

# 22 results for ext:js "Copyright (c) 2006-2008 Valerio Proietti" "http://mad4milk.net"
examples %w|
demos.mootools.net/demos/mootools.js
mootools.net/assets/scripts/mootools.core.js
mootools.net/assets/scripts/mootools.more.js
demos111.mootools.net/demos/mootools.svn.js
|

matches [

# mootools.core.js
{ :regexp=>/^\/\/ Load your build at: http:\/\/mootools.net\/core\// },

# Verson Detection # mootools.core.js
{ :version=>/^MooTools.More[\s]*=[\s]*\{[\s]*version:[\s]*["']?([^\"^\']+)["']?/ },
{ :version=>/^var MooTools[\s]*=[\s]*\{[\s]*version:[\s]*["']?([^\"^\']+)/ },

# mootools.more.js
{ :regexp=>/^\/\/MooTools More, <http:\/\/mootools.net\/more>. Copyright \(c\) 2006-2008 Valerio Proietti, <http:\/\/mad4milk.net>, MIT Style License./ },

]

end

