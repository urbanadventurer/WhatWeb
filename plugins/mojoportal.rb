##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-04 #
# Added match for setup page
##
Plugin.define "mojoPortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-09 
version "0.2"
description "mojoPortal is Free and Open Source. Create accessible, standards compliant web pages and content right in the browser. Powerful content management, easy to learn, easy to use. - homepage:http://www.mojoportal.com/"

# Google results as at 2011-03-04 #
# 392 for "Powered by mojoPortal"
# 22  for "Welcome to mojoPortal Setup" intitle:"mojoPortal Setup"

# Examples #
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
agro-house.com/Setup/Default.aspx
www.cssiofma.com
www.scdpmonline.org/Setup/Default.aspx
es.positionlogic.com/Setup/Default.aspx
www.creoconstruction.com/default.aspx
www.medinarcraceway.com
|

# Matches #
matches [

# GHDB: "Powered by mojoPortal"
{ :certainty=>25, :ghdb=>'"Powered by mojoPortal"' },

# Powered by text
{ :text=>"<a href='http://www.mojoportal.com' >Powered by mojoPortal</a>" },

{ :text=>"<a href='http://www.mojoportal.com'  title='mojoPortal.com'>Powered by mojoPortal</a>" },

# Default Head+Title HTML
{ :certainty=>25, :regexp=>/<head id="ct[0-9]+_Head[0-9]+"><title>/i },

# Setup Page # Default logo HTML
{ :text=>'	<img src="../Data/SiteImages/mojoportal-logo-med.gif" alt="mojoPortal Content Management System" />' },

# Setup Page # Default CSS
{ :text=>'<link id="Link1" runat="server" rel="stylesheet" href="../Data/style/setup.css" type="text/css"  />' },

]

end

