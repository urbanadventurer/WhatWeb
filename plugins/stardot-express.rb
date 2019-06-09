##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Stardot-Express"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-07-18
]
version "0.1"
description "The Express 6 Video Server is a small standalone server that streams video from up to six video cameras that plug into the back of it."
website "http://www.stardot-tech.com/"

# 20 results for intitle:"Express6 Live Image" @ 2010-07-18
# http://www.hackersforcharity.org/ghdb/?function=detail&id=1552
dorks [
'intitle:"Express6 Live Image"'
]

matches [

{ :regexp => %r{<title>Express6 Live Image( Popup)?</title>}, :version => '6' },

{ :regexp => %r{<tr><td><a href="http://www.stardot(-tech)?.com" target="(_new|_blank)"><img src="logo.gif" alt="" width="227" height="45"} },

{ :status => 401, :certainty => 75, :name => 'WWW-Authenticate realm', :regexp => /^Basic realm="Express6"/, :search=>"headers[www-authenticate]" }

]

end

