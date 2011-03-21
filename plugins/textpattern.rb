##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 by Andrew Horton
# Removed the aggressive function as it causes false postives

Plugin.define "Textpattern" do
author "Tonmoy Saikia"
version "0.2"
description "A flexible, elegant and easy-to-use CMS. Homepage:http://textpattern.com/"
examples %w|aidesign-dz.com
	    decisign.se
            designop.us
	    helloschema.com
	    jquerystyle.com
	    pixeleden.com
	    textgarden.org
	    textpattern.com
	    therissingtonpodcast.co.uk
	    tomaskaan.nl
	    tutsandtipps.the-netbrain.de
	    www.behindtheknife.com
	    www.capeotwayoceanlodge.com
	    www.casamemoire.org
	    www.lilayogastudio.com
	    www.logicgap.com
            www.marsmelons.com
            www.rosslyn-research.co.uk
            www.stockphotoexpert.com
	    www.studio180theatre.com
           |

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

