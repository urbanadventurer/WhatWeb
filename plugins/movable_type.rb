##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-07-07 # Brendan Coles <bcoles@gmail.com>
# updated regex
# added example urls, google dorks and version/path detection with mt-check.cgi
##
# Version 0.3
# Uses :version=>//
##
# Version 0.2
# remove :certainty
##

Plugin.define "Movable-Type" do
author "Andrew Horton"
version "0.4"
description "Blogging platform"
website "http://www.movabletype.org/"

# Google results as at 2011-07-07 #
# 122 for "Powered by Movable Type"
#  89 for inurl:/mt-check.cgi intitle:"Movable Type System Check [mt-check.cgi]"
#  26 for inurl:/mt/mt-check.cgi

# More examples:
# www.movabletype.com/showcase/

# Dorks #
dorks [
'"Powered by Movable Type"',
'inurl:/mt-check.cgi intitle:"Movable Type System Check [mt-check.cgi]"'
]



# Matches #
matches [

# javascript with 'mt' in the filename
{:name=>"javascript with 'mt' in the name",
:certainty=>50, :regexp=>/<script type="text\/javascript" src="[^"]+mt(-site)?\.js"><\/script>/},

# mt-tags|mt-tb|mt-cp|mt-search|mt-user-login|mt-recommend cgi
{:name=>"mt-tags|mt-tb|mt-cp|mt-search|mt-user-login|mt-recommend cgi",
:certainty=>75,
:regexp=>/"[^"]+\/mt-(tags|tb|cp|search|user-login|recommend)\.[f]?cgi[^"]*"/},

# Meta Generator
{:name=>"meta generator tag", :regexp=>/<meta name="generator" content="http:\/\/www\.movabletype\.org\/" \/>/},

# mt-check.cgi # Title
{ :text=>'<title>Movable Type System Check [mt-check.cgi]</title>' },

# Version Detection # mt-check.cgi
{ :version=>/<li><strong>Movable Type version:<\/strong> <code>([^<]+)<\/code><\/li>/ },

# Local Path Detection # mt-check.cgi
{ :filepath=>/<li><strong>Current working directory:<\/strong> <code>([^<]+)<\/code><\/li>/ },

# Powered by link
{:name=>"Powered by link", :regexp=>/<a href="http:\/\/sixapart\.com">Powered by Movable Type<\/a>/},
{:name=>"Powered by link", :regexp=>/Powered by <a href="http:\/\/www\.movabletype\.com\/"[^>]*>Movable Type<\/a>/ },

# Version Detection # Meta Generator
{:version=>/<meta name="generator" content="Movable Type ([^"]*)/,  :name=>"meta generator tag" } 

] 

end

=begin

# An aggressive plugin could check the following paths for confirmation:

# /mt or /mt/mt-check.cgi (discloses versions, paths)
# /mt/mt-tags.fcgi
# /mt-tb.fcgi
# /mt-cp.[f]?cgi
# /mt-search.cgi
# /mt-user-login.cgi
# /mt-recommend.cgi

# can't detect:
barackobama.com
blogs.oracle.com
electricartists.com/corporate
muledesign.com
www.radaronline.com
www.theatlantic.com
www.thehuffingtonpost.com

=end

