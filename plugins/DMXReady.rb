##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DMXReady" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-25
version "0.1"
description "DMXReady provides web professionals and do-it-yourselfers with an easy way to add powerful database-driven applications to their new or existing websites. Download, Unzip & Upload to your web server. - homepage: http://dmxready.com/"

# 29 results for inurl:inc_membersareamanager.asp @ 2010-07-25
examples %w|
demo.dmxready.com/applications/MembersAreaManager/inc_membersareamanager.asp
ehclientasp.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.graphicwhizard.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.petsumerreport.com/applications/MembersAreaManager/inc_membersareamanager.asp
membersaba.org/applications/MembersAreaManager/inc_membersareamanager.asp
www.nyfireinvestigators.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.davton.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.returnit.com.au/applications/MembersAreaManager/inc_membersareamanager.asp
pleasantonrugbyclub.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.valerielloyd.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.parchmentcraftguild.co.uk/applications/MembersAreaManager/inc_membersareamanager.asp
www.designedinternet.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.treasuretowerworldcanada.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.thebusinessexperience.co.uk/applications/MembersAreaManager/inc_membersareamanager.asp
www.vinylsiding.org/members/mam/applications/MembersAreaManager/inc_membersareamanager.asp
www.monarchjewelrycad.com/applications/MembersAreaManager/inc_membersareamanager.asp
teamnorwex.com/applications/MembersAreaManager/inc_membersareamanager.asp
www.ktowntickets.com/applications/MembersAreaManager/inc_membersareamanager.asp
|

matches [

{ :regexp=>/                  <p align="center"><a href="[\/a-zA-Z0-9\-_\+]*\/applications\/MembersAreaManager\/inc_membersareamanager.asp?show=sendpassword">Forget Password?<\/a>/ },

{ :regexp=>/      <form ACTION="[\/a-zA-Z0-9\-_\+]*\/applications\/MembersAreaManager\/inc_membersareamanager.asp" method="POST" name="login" onSubmit="YY_checkform\('login','entity_username','#q','0','Please provide username','entity_password','#q','0','Please provide password'\);return document.MM_returnValue" >/ },

]


end

