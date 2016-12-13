##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Speakker" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "Crossbrowser JavaScript audio solution based on HTML5"
website "http://www.speakker.com/"



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- INSTANTIATE SPEAKKER -->' },
{ :text=>'<!-- INCLUDE SPEAKKER -->' },

# JavaScript Source
{ :regexp=>/<script type="text\/javascript" src="[^"]+\/(projekktor|speakker)\.min\.js"><\/script>/ },

]

end


