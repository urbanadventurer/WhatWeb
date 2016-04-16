##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Semaphore" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-19
version "0.1"
description "Bridging the gap between layman's terms and official language to provide users with more accurate search results."
website "http://www.smartlogic.com/poweredbysemaphore"

# Google results as at 2011-03-19 #
# 40 for "Powered by Semaphore" inurl:semaphoreserver.exe filetype:exe

# Dorks #
dorks [
'"Powered by Semaphore" inurl:semaphoreserver.exe filetype:exe'
]



# Matches #
matches [

# GHDB
{ :ghdb=>'"Powered by Semaphore" inurl:semaphoreserver.exe filetype:exe' },

# Error Page
{ :text=>"<html><head><title>Semaphore server Error</title></head><body>" },

# HTML Comment
{ :text=>'<!-- Display the "Powered by Semaphore" logo -->' },

# Powered by logo HTML
{ :regexp=>/<a href="http:\/\/www.smartlogic.com\/poweredbysemaphore"><img src="[^"^>]+\/semaphore\/semaphore_small\.gif"[^>]+alt="Powered by Semaphore" title="Powered by Semaphore" \/><\/a>/ },

]

end


