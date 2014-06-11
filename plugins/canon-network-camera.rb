##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Canon-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.1"
description "Canon's new all-in-one VB-C50i and VB-C50iR (in a reverse mount) pan/tilt/zoom (PTZ) network video cameras allow individuals, whether in the back storage room or airport waiting room, to remotely view live video footage even in the most adverse conditions. - http://www.usa.canon.com/templatedata/pressrelease/20040331_vbc50i.html"
# Design spec: http://www.usa.canon.com/app/pdf/nvideo/VB-C50i_AE_Spec_May1_07.pdf



matches [

# 268 results @ 2010-06-29
{:certainty=>75,:ghdb=>'intitle:liveapplet inurl:LvAppl'},

# 215 results @ 2010-06-29
# http://www.hackersforcharity.org/ghdb/?function=detail&id=434
{:certainty=>75,:ghdb=>'+intitle:"Network Camera VB-C50i/VB-C50iR" +"Viewer for PC"'},

# default VB-C50i title
{:text=>'<TITLE>Network Camera VB-C50i/VB-C50iR</TITLE>', :version=>'VB-C50i'},

# default javascript
{:text=>'function L(n,g) {var i=document.images[n]; if (i)I[n]=new H(i,i.src,"/v/"+g+".gif")}',:version=>"VB-C50i"},
{:text=>'function L(n,g) {var i=document.images[n];if (i)I[n]=new H(i,i.src,"/v/"+g+".gif")}',:version=>"VB-C50i"},

# default applet cabbase
{:text=>'<param name=cabbase	value="LiveApplet.cab">',:version=>"WebView"},

# default webview title
{:text=>'<title>LiveApplet</title>',:version=>"WebView"},

]

end

