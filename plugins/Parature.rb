##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Parature" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-07-29
version "0.1"
description "Parature - web-based customer service software combine - Homepage: http://www.parature.com/"

# Google results as at 2012-07-29 #
# 379 for "Help Desk and Customer Support Software by Parature" inurl:"ics/support/default.asp"

# Dorks #
dorks [
'"Help Desk and Customer Support Software by Parature" inurl:"ics/support/default.asp"'
]

# Examples #
examples %w|
https://success.parature.com/
https://d2.parature.com/ics/support/default.asp?deptID=8210&task=knowledge&questionID=3598
https://support.landslide.com/ics/support/default.asp
https://support.zenoss.com/ics/support/default.asp
https://www.gaiaonlinehelp.com/ics/support/default.asp?deptID=5694&task=knowledge&questionID=380
https://support.hodges.edu/ics/support/default.asp?deptID=8336&task=knowledge&questionID=1418
http://support.velasystems.com/ics/support/default.asp?deptID=15138&task=knowledge&questionID=188
http://support.blackboardcollaborate.com/ics/support/default.asp?deptID=8336&task=knowledge&questionID=1473
http://support.comptia.org/ics/support/default.asp?deptID=15074&task=knowledge&questionID=659
http://support1.geomagic.com/ics/support/default.asp?deptID=5668&task=knowledge&questionID=2091
http://examsoft.parature.com/ics/support/default.asp?deptID=15194&task=knowledge&questionID=7
http://support.chemstations.com/ics/support/default.asp?deptID=16157
https://support.sewp.nasa.gov/ics/support/default.asp?deptID=15032&task=knowledge&questionID=145
http://cshelp.lycos.com/ics/support/default.asp?deptID=16049&task=knowledge&questionID=943
http://support.horizondatasys.com/ics/support/default.asp?deptID=4443&task=knowledge&questionID=111
http://support.softchalk.com/ics/support/default.asp?deptID=15143&task=knowledge&questionID=1036
http://help.tinierme.com/ics/support/default.asp?deptID=15141&task=knowledge&questionID=273
http://att.support.iplay.com/ics/support/default.asp?deptID=16163
|

# Matches #
matches [

# NoScipt
{ :text=>'This Website requires your browser to be JavaScript enabled. Please enable JavaScript  and click <a href="/ics/default.asp">here</a> to continue.' },

# HTML Comment
{ :string=>/<\!\-\- \*\*\*\*\*\* (PRODAPP[^\s]+) *\*\*\*\*\* \-\->/ },

# JavaScript
{ :version=>/<!--<script src="\.\.\/ic1Browser\.js\?ver=([^"]+)"><\/script>-->/ },

# JavaScript # RedirectPortalURL
{ :certainty=>75, :text=>"RedirectPortalURL('/ics/support/custhandler.asp?task=signOut&redirectURL=' + encodeURI('" },

# Frame title="Left Navigation"
{ :text=>'<frame title="Left Navigation" name="cypLeft" src="KBFolder.asp?deptID=' },

# Invalid deptID in URL. Please make sure you have the entire, correct URL.
{ :md5=>"5b5120dc4f0bb058180da4361ac8fd70" },

]

end

