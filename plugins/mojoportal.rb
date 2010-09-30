##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "mojoPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-09 
version "0.1"
description "mojoPortal is Free and Open Source. Create accessible, standards compliant web pages and content right in the browser. Powerful content management, easy to learn, easy to use. - homepage:http://www.mojoportal.com/"
examples %w|
www.mojoportal.com
storedemo.mojoportal.com
demo.mojoportal.com
www.bigberrydigital.com
i7media.net/mojoportal-hosting
es.mojoportal.com
www.artyalin.com
www.sourcetreesolutions.com
garthvh.com
www.sandypondconsulting.com
www.mercatus3.com
www.joeaudette.com
www.skye1907.com
demos.retroviz.com/mojoportal/
phoulihandds.com
www.allelegance.com
www.snowscape.com/mojoPortal/
www.foodmarketingmadesimple.com
bollagardar.net
www.gpofr.com/portal/
www.chartwellstables.co.za
www.riovara.net
pocketcigarguide.com
kellyfurnitureservice.com/cms/
|

matches [

# About 178,000 results @ 2010-06-09
{:name=>'GHDB: "Powered by mojoPortal"',
:certainty=>25,
:ghdb=>'"Powered by mojoPortal"'
},

# powered by text with unique HTML structure
{:name=>"powered by text 1", 
:text=>"<a href='http://www.mojoportal.com' >Powered by mojoPortal</a>"
},

# powered by text with unique HTML structure
{:name=>"powered by text 2",
:text=>"<a href='http://www.mojoportal.com'  title='mojoPortal.com'>Powered by mojoPortal</a>"
},

# default title html
{:name=>"default title html",
:certainty=>25,
:regexp=>/<head id="ct[0-9]+_Head[0-9]+"><title>/i
}

]

end

