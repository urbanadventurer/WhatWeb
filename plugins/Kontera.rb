##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kontera" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-29
version "0.1"
description "Kontera - Contextual In-Text Advertising - Homepage: http://www.kontera.com/"

# Examples #
examples %w|
netsoluti0n.blogspot.com
www.streetviewfunny.com/streetviewfunny/index.php
www.spraygroundsusa.com/published_data.txt
www.verazlaboral.com
|

# Matches #
matches [

# HTML Comments
{ :text=>'<!-- Kontera(TM);-->' },
{ :text=>'<!-- end Kontera(TM) -->' },
{ :text=>'<!-- Kontera ContentLink(TM);-->' },

# HTML Comment + JavaScript # Publisher ID Detection
{ :account=>/<script type='text\/javascript'>\s*var dc_AdLinkColor = '[^']+'\s*;\s*var dc_PublisherID = ([\d]+)\s*;/ },

# JavaScript
{ :text=>"<script type='text/javascript' src='http://kona.kontera.com/javascript/lib/KonaLibInline.js'>" },

]

end

