##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3
# Uses :version=>//
##
# Version 0.2
# removed :name & :probability
##
Plugin.define "InvisionPowerBoard" do
author "Andrew Horton"
version "0.3"
description "Invision Power Board - PHP Web Forum"
website "http://www.invisionpower.com/"

# Dorks #
dorks [
'intitle:"Powered by Invision Power Board"'
]



# <title>Metacafe Forums (Powered by Invision Power Board)</title>
# <div id="ipbwrapper">
# <script type="text/javascript" src='jscripts/ips_xmlhttprequest.js'></script>
# <a href="http://forums.metacafe.com//index.php?s=f237b6183efd7298889f2216b2710e6f&amp;act=Login&amp;CODE=00">Log In</a>

#         				  <div align='center' class='copyright'>
#        				  	Powered By <a href='http://www.invisionboard.com' style='text-decoration:none' target='_blank'>IP.Board</a>
#       				  	2.2.1 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' style='text-decoration:none' target='_blank'>IPS, Inc</a>.
#        				  </div>


#				<!-- Copyright Information -->
#        				  <p id='copyright' class='right'>
#        				  	Powered By <a href='http://www.invisionboard.com' title='IP.Board Homepage'>IP.Board</a>
#        				  	3.0.2 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' title='IPS Homepage'>IPS, <abbr title='Incorporated'>Inc</abbr></a>.
#        				  <br />Licensed to: Invision Power Services, Inc</p>
#		<!-- / Copyright -->



# <link rel="stylesheet" type="text/css" media="print" href="http://forum.emule-project.net/public/style_css/css_1/ipb_print.css" />
#<!-- Copyright Information -->
#        				  <p id='copyright' class='right'>
#        				  	Powered By <a href='http://www.invisionboard.com' title='IP.Board Homepage'>IP.Board</a>
#        				  	 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' title='IPS Homepage'>IPS, <abbr title='Incorporated'>Inc</abbr></a>.
#        				  <br />Licensed to: eMule-Project.net</p>
#		<!-- / Copyright -->


#<!-- Copyright Information -->
#        				  <div align='center' class='copyright'>
#        				  	Powered By <a href='http://www.invisionboard.com' style='text-decoration:none' target='_blank'>IP.Board</a>
#        				  	 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' style='text-decoration:none' target='_blank'>IPS, Inc</a>.
#        				  <div>Licensed to: CartoTalk.com</div></div>
#		<!-- / Copyright -->		

#	<div align='center' class='copyright'>
#	<a href='http://www.invisionboard.com' style='text-decoration:none' target='_blank'>Invision Power Board</a>
#	v2.1.6 &copy; 2009 &nbsp;IPS, Inc.
#	</div>

# <title>CakePHP UnOfficial Community Forum (Powered by Invision Power Board)</title> 
# <div id="ipbwrapper">
#<div align='center' class='copyright'>Powered by <a href="http://www.invisionboard.com" target='_blank'>Invision Power Board</a>(U) v1.3 Final &copy; 2003 &nbsp;<a href='http://www.invisionpower.com' target='_blank'>IPS, Inc.</a></div>

#  	3.0.2 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' title='IPS Homepage'>IPS, <abbr
# 	2.2.1 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' style='text-decoration:none' target='_blank'>IPS, Inc</a>.


# <script type="text/javascript" src='jscripts/ipb_global.js'></script>


# <script type='text/javascript' src='http://forum.emule-project.net/public/js/ipb.js?load=quickpm,hooks,board'></script>
# <link rel="alternate feed" type="application/rss+xml" title="eMule Board - General" href="http://forum.emule-project.net/index.php?app=core&amp;module=global&amp;section=rss&amp;type=forums&amp;id=1" />
# <p id='content_jump'><a id='top'></a><a href='#j_content' title='Jump to content' accesskey='m'>Jump to content</a></p>
#<form action="http://forum.emule-project.net/index.php?app=core&amp;module=search&amp;do=quick_search&amp;search_filter_app[forums]=1" method="post" id='search-box' >

# Matches #
matches [
{:text=>'(Powered by Invision Power Board)</title>' },
{:text=>'index.php?app=core&amp;module=global&amp;section=rss&amp;type=forums&amp;id=' },
{:certainty=>50, :text=>"<a href='#j_content' title='Jump to content' accesskey='m'>Jump to content</a>" }, #'
{:regexp=>/<script [^>]+src='[^']+\/ipb\.js/ },
{:regexp=>/<script [^>]*src='[^']+\/ipb_global\.js'>/}, #'
{:text=>'<div id="ipbwrapper">' },
{:regexp=>/<div [^>]*class='copyright'>Powered by <[^>]+>Invision Power Board<\/a>/ },
{:regexp=>/<script type="text\/javascript" src='[^']*ips_xmlhttprequest\.js'><\/script>/ }, #'
{:text=>"Powered By <a href='http://www.invisionboard.com' style='text-decoration:none' target='_blank'>IP.Board</a>" },
{:regexp=>/&copy; [0-9]+ &nbsp;<a href='http:\/\/www\.invisionpower\.com'[^>]*>IPS, Inc</ },
{:regexp=>/&copy; [0-9]+ &nbsp;<a href='http:\/\/www\.invisionpower\.com'[^>]*>IPS, <abbr title='Incorporated'>Inc<\/abbr></ },
{:regexp=>/<a href="[^"]+index\.php\?s=[a-z0-9]+&amp;act=Login&amp;CODE=[0-9]+">Log In<\/a>/ }, # "


{:version=>/Powered by <a [^>]+>Invision Power Board<\/a>([^&]+) &copy; 20[0-9]+/,  :name=>"powered by 1" },
{:version=>/([0-9\.]+) &copy; 20[0-9]+ &nbsp;<a href='http:\/\/www\.invisionpower\.com'[^>]+>IPS/,  :name=>"powered by 2" },
{:version=>/Invision Power Board<\/a>[\s]+v([0-9\.]+) &copy;/,  :name=>"powered by 3" },
{:version=>/Invision Power Board<\/a>([^&]+)&copy; 20[0-9]+ &nbsp;<a href='http:\/\/www\.invisionpower\.com'/,  :name=>"powered by 4" }

]

#Invision Power Board</a>(U) v1.3 Final &copy; 2003 &nbsp;<a href='http://www.invisionpower.com' target='_blank'>IPS, Inc.</a></div>

#  	3.0.2 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' title='IPS Homepage'>IPS, <abbr
# 	2.2.1 &copy; 2009 &nbsp;<a href='http://www.invisionpower.com' style='text-decoration:none' target='_blank'>IPS, Inc</a>.

#Invision Power Board</a>
#	v2.1.6 &copy; 2009 &nbsp;IPS, Inc.
	
end

