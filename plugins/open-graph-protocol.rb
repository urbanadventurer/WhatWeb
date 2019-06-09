##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Open-Graph-Protocol"
authors [
  "Caleb Anderson",
  "Brendan Coles <bcoles@gmail.com> #", # v0.2 # 2010-10-22 # Added type, user id and app id extraction. 
  # Brendan Coles <bcoles@gmail.com> #, # v0.3 # 2011-03-05 # Updated regex. 
]
version "0.3"
description "The Open Graph protocol enables you to integrate your Web pages into the social graph. It is currently designed for Web pages representing profiles of real-world things . things like movies, sports teams, celebrities, and restaurants. Including Open Graph tags on your Web page, makes your page equivalent to a Facebook Page."



# Matches #
matches [

# Meta tag # Match og:title
{ :regexp=>/<meta[^>]+property="og:title"[^>]*>/i },

# Get type # og:type
{ :version=>/<meta[^>]+property="og:type"[^>]+content="([^"^>]+)"/ },

# Get user IDs # fb:admins
{ :account=>/<meta[^>]+property="fb:admins"[^>]+content="([^"^>]+)"/ },

# Get app IDs # fb:app_id
{ :module=>/<meta[^>]+property="fb:app_id"[^>]+content="([^"^>]+)"/ },

]

end


