##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :name and :certainty=>100
# Version 0.3
# changed DotNetNuke� to DotNetNuke.{3} 
# Version 0.4
# uses :modules now

Plugin.define "DotNetNuke" do
author "Andrew Horton"
version "0.4"
description "DotNetNuke is an opensource CMS for Microsoft .Net Homepage: www.dotnetnuke.com. Passively detects modules and the copyright year"

# it's good practice to select examplesfrom multiple sources
# pages 1,2,3,4,6,8 from http://dnngallery.net/
# www.dotnetnuke.com/Products/NewtoDotNetNuke/DotNetNukeShowcaseSites/tabid/541/Default.aspx

# this list only has 1 from 2005. it's not representative of older versions

examples %w|
http://4-h.org/ http://camt.artsnet.org/ http://cnycf.org/cnycf/ http://cuongdang.net/ http://denvergov.com/ http://franchise.littlecaesars.com/ http://jacoby-studio.com/ http://laautoshow.com/Default.aspx http://seablick.com/ http://web.pella.com/ http://wildlandstrust.org/ http://www.4most.co.za/ http://www.activesocial.com http://www.advent1.com/ http://www.alphadeltaphi.org/ http://www.aroundthecreek.com/ http://www.bearmountain.ca/ http://www.bhcri.ca/ http://www.bingway.com/default.aspx http://www.boschhotwater.com/ http://www.bridgersteel.com/ http://www.businessstrategy.com/ http://www.can-trace.org/ http://www.cata.org/ http://www.cdacompass.com/ http://www.cdiradiology.com/ http://www.chewninginspections.com/ http://www.ci.snoqualmie.wa.us/ http://www.clazyu.com/ http://www.collages.net/ http://www.coretrate.com/ http://www.cosis.us/ http://www.dangandvanda.com/ http://www.dnnwerk.de/ http://www.dotnetnukeblogs.com/ http://www.dreamwright.com/ http://www.earsinus.com/ http://www.ecater.com.au/ http://www.edgenet.com/ http://www.edgetrainingsystems.com/ http://www.elcaminohospital.org/ http://www.elevenwireless.com/ http://www.engagesoftware.com/ http://www.engageuniversity.com/ http://www.enterprisebank.com/Home.aspx http://www.esp-net.com/ http://www.forestry.ubc.ca/ http://www.fpcanoagem.pt/ http://www.glowline.co.za/ http://www.golfcoursearchitecture.net/ http://www.graphiksolutions.ca/ http://www.greenisdead.org/ http://www.hamiltoncaster.com/ http://www.indianmotorcycle.com/ http://www.iowacomputergurus.com/ http://www.kingslodgehogsback.co.za/ http://www.lansing.org/ http://www.late.com.br/ http://www.logicspectrum.com/ http://www.lourdes.edu/ http://www.magenic.com/ http://www.maplewoodnursinghome.com/ http://www.maritimebeauty.com/ http://www.meetingstreet.org/ http://www.mentores.net/ http://www.minhphuongvn.com/ http://www.ncazaleafestival.org/ http://www.ncomputing.com/ http://www.neoteo.com/ http://www.odysseynetworks.org/ http://www.onplonge.com/ http://www.onwindows.com/ http://www.plaestanyjove.org/ http://www.poppov.org/ http://www.prnatech.org/ http://www.puredotnetnuke.com/ http://www.r2integrated.com/ http://www.rentalspacenetwork.com/ http://www.rilisc.org/ http://www.rlg.net/ http://www.rosequarter.com/ http://www.rustconsulting.com/ http://www.sakesocial.com/ http://www.sc4k.org/ http://www.sck.net/ http://www.segway.it/ http://www.skyetek.com/ http://www.spectracomcorp.com/ http://www.stlartworks.org/ http://www.summitconversations.org/ http://www.sunshinelighting.com/ http://www.thousandislandslife.com/ http://www.transperth.wa.gov.au/ http://www.unpan.org/ http://www.visitmo.com/ http://www.windmillroadhouse.co.za/ http://www.wineaustralia.com/australia http://www.workoutbox.com/ http://www.yesmail.com/ http://www.zymmetrical.com/
|

# CSS file path - type="text/css" href="/Portals/_default/Containers/
# CSS file path - type="text/css" href="/Portals/_default/Skins/
# Portals, portals, 
#4-h.org-.html:<link href="/c/Portals/_default/default.css
#www.elevenwireless.com-.html:<img src="/portals/_default/skins/eleven/images/logo-bottom-trans.gif


#<head id="Head">
#<!--**********************************************************************************-->
#<!-- DotNetNuke� - http://www.dotnetnuke.com                                          -->
#<!-- Copyright (c) 2002-2008                                                          -->
#<!-- by DotNetNuke Corporation                                                        -->
#<!--**********************************************************************************-->


# www.thousandislandslife.com
#<!-- Copyright (c) 2002-2009                                                          -->
# www.sck.net
#<!-- Copyright (c) 2002-2007                                                          -->


#<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTA1MjU0NzA5MA9kFgZmDxYCHgRUZXh0BXk8IURPQ1RZUEUgaHRtbCBQVUJMSUMgIi0vL1czQy8vRFREIFhIVE1MIDEuMCBUcmFuc2l0aW9uYWwvL0VOIiAiaHR0cDovL3d3dy53My5vcmcvVFIveGh0bWwxL0RURC94aHRtbDEtdHJhbnNpdGlvbmFsLmR0ZCI+ZAIBD2QWDAIBDxYCHgdWaXNpYmxlaGQCAg8WAh4HY29udGVudAWVAUJ1aWxkIHlvdXIgbGlzdCAmIGJvb3N0IGN1c3RvbWVyIGxveWFsdHkgd2l0aCBlbWFpbCBtYXJrZXRpbmcgc29mdHdhcmUgYW5kIGVtYWlsIG1hcmtldGluZyBzb2x1dGlvbnMgZnJvbSBZZXNtYWlsLiBTaWduIHVwIHRvZGF5IGZvciB5b3VyIGZyZWUgdHJpYWwuZAIDDxYCHwIFRGVtYWlsIG1hcmtldGluZywgZW1haWwgbWFya2V0aW5nIHNvZnR3YXJlLCBlbWFpbCBtYXJrZXRpbmcgc29sdXRpb25zZAIEDxYCHwIFG8KpIDIwMTAgQWxsIFJpZ2h0cyBSZXNlcnZlZGQCBQ8WAh8CBQtEb3ROZXROdWtlIGQCBg8WAh8CBQdZZXNtYWlsZAICD2QWAgIBD2QWAgIED2QWAmYPZBYOZg9kFgJmDxYMHhVkbm4kVG9wTmF2JG93c1BFUlBBR0UFATAeGFJlY29yZHNQZXJQYWdlZG5uJFRvcE5hdmYeFUN1cnJlbnRQYWdlZG5uJFRvcE5hdmYeEmRubiRUb3BOYXYkb3dzUEFHRWYeFlRvdGFsUmVjb3Jkc2RubiRUb3BOYXYCBx4UVG90YWxQYWdlc2RubiRUb3BOYXYCAWQCAQ9kFgICAQ9kFgRmDw8WAh8BaGRkAgIPZBYCAgIPFgIfAWhkAgIPZBYCAgEPZBYCZg8PFgIfAWhkZAIDD2QWAgIBD2QWBmYPDxYCHwFoZGQCAQ9kFgICAg8WAh8BaGQCAg9kFgICAQ9kFgICAQ9kFgJmDxYMHhpkbm4kY3RyNTQ3JGRubiR4ZG5uUEVSUEFHRQUBMB4cUmVjb3Jkc1BlclBhZ2Vkbm4kY3RyNTQ3JGRubmYeGUN1cnJlbnRQYWdlZG5uJGN0cjU0NyRkbm5mHhdkbm4kY3RyNTQ3JGRubiR4ZG5uUEFHRWYeGlRvdGFsUmVjb3Jkc2RubiRjdHI1NDckZG5uAgMeGFRvdGFsUGFnZXNkbm4kY3RyNTQ3JGRubgIBZAIED2QWAgIBD2QWBmYPDxYCHwFoZGQCAg8PFgIfAWdkZAIED2QWAgICDxYCHwFoZAIFD2QWAgIBD2QWAmYPDxYCHwFoZGQCBg9kFgICAQ9kFgJmDw8WAh8BaGRkZE00Mc5tmMkPKNC7lBhbrPTPDX7U" /
# the viewstate contains the string DotNetNuke.
# the encoding depends on the characters position within a 3 octet group
# in base64 it can be represented as: RG90TmV0TnVrZ, RvdE5ldE51a2, 3ROZXROdWtl


# <div id="dnn_ControlPanel"></div>
# <div id="dnn_ctr377_ContentPane" class="homeh1main DNNAlignleft">
# <span id="dnn_dnnCOPYRIGHT_lblCopyright" class="Copyright">

#www.sunshinelighting.com-.html:        <input name="__dnnVariable" type="hidden" id="__dnnVariable" />
#www.thousandislandslife.com-.html:        <input name="__dnnVariable" type="hidden" id="__dnnVariable" value="`{`__scdoff`:`1`}" />


# www.cdiradiology.com-.html
#                <META NAME="COPYRIGHT" CONTENT="Copyright 2002-2005 DotNetNuke">
#                <META NAME="GENERATOR" CONTENT="DotNetNuke 3.1.1">


matches [
{:regexp=>/src="[^"]*\/portals\/_default\/(containers|skins)/i},
{:name=>"copyright",:regexp=>/<\!\-\- DotNetNuke.{3} \- http:\/\/www.dotnetnuke.com/},
{:regexp=>/<META NAME="COPYRIGHT" CONTENT="Copyright 2002-[0-9]{4} DotNetNuke">/},

#id="__VIEWSTATE" value="
{:name=>"VIEWSTATE contains DotNetNuke",
:regexp=>/__VIEWSTATE" value="[^"]*RG90TmV0TnVrZ|RvdE5ldE51a2|3ROZXROdWtl/}, #"

{:text=>'<div id="dnn_ctr'},
{:certainty=>75, :text=>'<div id="dnn_'},
{:text=>'<input name="__dnnVariable" type="hidden" id="__dnnVariable"'} #reliable 

]


def passive
	m=[]
# some sites have this cookie
#Set-Cookie: DotNetNukeAnonymous=0c88a623-73a3-4242-8506-0ea4fe21076a; expires=Fri, 09-Apr-2010 02:37:52 GMT; path=/; HttpOnly
	m << {:name=>"DotNetNukeAnonymous Cookie" } if @meta["set-cookie"] =~ /DotNetNukeAnonymous=/

# passively detect modules
# modules are in the path /DesktopModules/xxx	

	if @body =~ /"\/DesktopModules\/[^\/]+/
		modules = @body.scan(/"\/DesktopModules\/([^\/]+)/).flatten.compact.sort.uniq
		m << {:name=>"passive",:modules=>modules}
	end	
	
# copyright year
	if @body =~ /<!-- DotNetNuke[^<]*<!-- Copyright \(c\) 2002-[0-9]{4}/
		year = @body.scan(/<!-- DotNetNuke[^<]*<!-- Copyright \(c\) 2002-([0-9]{4})/).flatten.compact.sort.uniq.to_s
		m << {:name=>"copyright year",:string=>year}
	end	
	
	m
end


# good way to confirm it's dotnetnuke.
# /logo.gif
# 

end


