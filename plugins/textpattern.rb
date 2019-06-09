##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Textpattern"
authors [
  "Tonmoy Saikia",
  "Andrew Horton", # v0.2 # Removed the aggressive function as it causes false postives 
]
version "0.2"
description "A flexible, elegant and easy-to-use CMS. Homepage:http://textpattern.com/"


matches [
{:name=>"generator",
:certainty=>50, 
:regexp=>/<meta name=\"generator\"[^>]+content=\"textpattern" \/>/i
},

{:name=>"jquery.js",
:regexp=>/<script[^>]+src="[^"]+textpattern\/jquery.js[^"]*">/
},

{:name=>"css.php",
:regexp=>/<link[^>]+href=\"[^"]+textpattern\/css.php[^"]*" \/>/
},

{:name=>"/textpattern",
:text=>'<td id="view-site" class="tabdown">',
:url=>"/textpattern"}
]


end

