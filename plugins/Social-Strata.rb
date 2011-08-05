##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Social-Strata" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-21
version "0.1"
description "Homepage: http://socialstrata.com/"

# Google results as at 2011-04-21 #
# 60 for inurl:"/eve/personal?x_myspace_page=profile"
#  3 for "Error u is invalid. Powered by: GroupeeTM"

# Dorks #
dorks [
'inurl:"/eve/personal?x_myspace_page=profile"'
]

# Examples #
examples %w|
nyustudyabroad.infopop.cc/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
nyusummer.infopop.cc/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
forums.military.com/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
community.discovery.com/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
ewmxschools.com/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
forums.organicgardening.com/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
fsae.com/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
community.rachaelleighcook.net/eve/personal?x_myspace_page=profile&u=$GS_USER_OID
|

# Matches #
matches [

# URL pattern
{ :ghdb=>'inurl:"/eve/personal?x_myspace_page=profile" "Powered by Social Strata"' },

# Powered by text
{ :text=>'<a href="http://socialstrata.com/landing/goto.php?a=eve" target="_blank">Powered by Social Strata</a>' },

# Version Detection # Powered by text
{ :version=>/Powered by: <a target="_blank" href="http:\/\/eveforenterprise\.com">Groupee<\/a><SUP>TM<\/SUP> \(version ([\d\.]+)\) from Groupee Inc\./ },

]

end


