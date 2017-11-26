##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # Andrew Horton
# Added website. Tidied up description
##
# Version 0.2 # 2016-08-19 # Bhavin Senjaliya <bhavin.senjaliya@gmail.com>
# Added cookie
##


Plugin.define do
name "XenForo"
author "Mateusz Golewski"
version "0.3"
description "Commercial community forum developed in PHP."
website "https://xenforo.com/"

matches [

{:name=>"HTML id element", :regex=>/<html[^>]+id="XenForo"/},

# Cookie
{ :search => "headers[set-cookie]", :regexp => /^xf_session/, :name=>"xf_session cookie" },

]

end
