##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-05-08
# Added 3 matches from Steve 'Ashcrow' Milner
##
Plugin.define "Apache-Wicket" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-27
version "0.2"
description "Apache Wicket, commonly referred to as Wicket, is a lightweight component-based web application framework for the Java programming language - Homepage: http://wicket.apache.org/"

# ShodanHQ results as at 2011-08-27 #
# 85 for wicket

# Google results as at 2011-08-27 #
# 267 for inurl:"wicket:bookmarkablePage"

# Dorks #
dorks [
'inurl:"wicket:bookmarkablePage"'
]

# Examples #
examples %w|
217.66.178.110
128.125.166.250
69.84.104.153
128.125.166.108
204.119.17.66
68.181.168.160
128.125.69.93
68.181.168.154
74.87.5.146
71.40.235.251
|

# Matches #
matches [

# GHDB # URL Pattern
{ :ghdb=>'inurl:"wicket:bookmarkablePage=:"' },

# XMLNS data
{:name=>'XMLNS data',
 :regexp=>/xmlns:wicket="(http:\/\/wicket\.sourceforge\.net\/|http:\/\/wicket\.apache\.org\/)">/ },

# Wicket ID scheme
{:name=>'Wicket ID scheme',
 :certainty=>75,
 :regexp=>/ wicket:id="[^"]*"/},

# Wicket Resource scheme
{:name=>'Wicket Resource scheme',
 :certainty=>25,
 :regexp=>/<[^=]+[ ]?=[ ]?['"]?wicket\/[^\/]+\/org\.apache\.wicket\./},

]

end

