##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Updated description
##
Plugin.define "DUforum" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-02 
version "0.2"
description "Forum. Homepage used to be http://www.duware.com/"

# Dorks #
dorks [
'"powered by duforum" intitle:DUdforum'
]

matches [

# About 4,940 results @ 2010-06-02
{:certainty=>75, :ghdb=>'+"powered by duforum" +intitle:DUdforum' },
{:name=>"default title",  :regexp=>/<title>DUdforum[0-9a-zA-Z\ \.-]+<\/title>/},
{:name=>"default text", :text=>'<td align="right" valign="middle" class="text">Powered by <a href="http://www.duware.com" target="_blank">DUforum</a></td>'
}

]

end

