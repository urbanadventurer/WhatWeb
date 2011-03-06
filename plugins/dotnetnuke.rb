##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.5 # 2011-03-06 # Brendan Coles <bcoles@gmail.com>
# Updated module and version detection
##
# Version 0.4
# uses :module now
##
# Version 0.3
# changed DotNetNuke� to DotNetNuke.{3}
##
# Version 0.2
# removed :name and :certainty=>100
##
Plugin.define "DotNetNuke" do
author "Andrew Horton"
version "0.5"
description "DotNetNuke is an opensource CMS for Microsoft .Net Homepage: www.dotnetnuke.com. Passively detects modules and the copyright year"

# More examples :
# http://dnngallery.net/
# www.dotnetnuke.com/Products/NewtoDotNetNuke/DotNetNukeShowcaseSites/tabid/541/Default.aspx

# Google results as at 2011-03-06 #
# 442 for "Powered by dotnetnuke"

# Examples #
examples %w|
www.wi-ineta.org 173.203.139.170 http://4-h.org/ http://camt.artsnet.org/ http://cnycf.org/cnycf/ http://cuongdang.net/ http://denvergov.com/ http://franchise.littlecaesars.com/ http://jacoby-studio.com/ http://laautoshow.com/Default.aspx http://seablick.com/ http://web.pella.com/ http://wildlandstrust.org/ http://www.4most.co.za/ http://www.activesocial.com http://www.advent1.com/ http://www.alphadeltaphi.org/ http://www.aroundthecreek.com/ http://www.bearmountain.ca/ http://www.bhcri.ca/ http://www.bingway.com/default.aspx http://www.boschhotwater.com/ http://www.bridgersteel.com/ http://www.businessstrategy.com/ http://www.can-trace.org/ http://www.cata.org/ http://www.cdacompass.com/ http://www.cdiradiology.com/ http://www.chewninginspections.com/ http://www.ci.snoqualmie.wa.us/ http://www.clazyu.com/ http://www.collages.net/ http://www.coretrate.com/ http://www.cosis.us/ http://www.dangandvanda.com/ http://www.dnnwerk.de/ http://www.dotnetnukeblogs.com/ http://www.dreamwright.com/ http://www.earsinus.com/ http://www.ecater.com.au/ http://www.edgenet.com/ http://www.edgetrainingsystems.com/ http://www.elcaminohospital.org/ http://www.elevenwireless.com/ http://www.engagesoftware.com/ http://www.engageuniversity.com/ http://www.enterprisebank.com/Home.aspx http://www.esp-net.com/ http://www.forestry.ubc.ca/ http://www.fpcanoagem.pt/ http://www.glowline.co.za/ http://www.golfcoursearchitecture.net/ http://www.graphiksolutions.ca/ http://www.greenisdead.org/ http://www.hamiltoncaster.com/ http://www.indianmotorcycle.com/ http://www.iowacomputergurus.com/ http://www.kingslodgehogsback.co.za/ http://www.lansing.org/ http://www.late.com.br/ http://www.logicspectrum.com/ http://www.lourdes.edu/ http://www.magenic.com/ http://www.maplewoodnursinghome.com/ http://www.maritimebeauty.com/ http://www.meetingstreet.org/ http://www.mentores.net/ http://www.minhphuongvn.com/ http://www.ncazaleafestival.org/ http://www.ncomputing.com/ http://www.neoteo.com/ http://www.odysseynetworks.org/ http://www.onplonge.com/ http://www.onwindows.com/ http://www.plaestanyjove.org/ http://www.poppov.org/ http://www.prnatech.org/ http://www.puredotnetnuke.com/ http://www.r2integrated.com/ http://www.rentalspacenetwork.com/ http://www.rilisc.org/ http://www.rlg.net/ http://www.rosequarter.com/ http://www.rustconsulting.com/ http://www.sakesocial.com/ http://www.sc4k.org/ http://www.sck.net/ http://www.segway.it/ http://www.skyetek.com/ http://www.spectracomcorp.com/ http://www.stlartworks.org/ http://www.summitconversations.org/ http://www.sunshinelighting.com/ http://www.thousandislandslife.com/ http://www.transperth.wa.gov.au/ http://www.unpan.org/ http://www.visitmo.com/ http://www.windmillroadhouse.co.za/ http://www.wineaustralia.com/australia http://www.workoutbox.com/ http://www.yesmail.com/ http://www.zymmetrical.com/
|
# Matches #
matches [

# CSS file path
{:regexp=>/src="[^"]*\/portals\/_default\/(containers|skins)/i},

# HTML Copyright Comment
{:name=>"copyright",:regexp=>/<\!\-\- DotNetNuke.{3} \- http:\/\/www.dotnetnuke.com/},

# Meta Copyright
{:regexp=>/<META NAME="COPYRIGHT" CONTENT="Copyright 2002-[0-9]{4} DotNetNuke">/},

# Meta Generator
{ :text=>'<meta id="MetaGenerator" name="GENERATOR" content="DotNetNuke " />' },

# id="__VIEWSTATE" value="
{:name=>"VIEWSTATE contains DotNetNuke",
:regexp=>/__VIEWSTATE" value="[^"]*RG90TmV0TnVrZ|RvdE5ldE51a2|3ROZXROdWtl/},

# Default div id
{:text=>'<div id="dnn_ctr'},
{:certainty=>75, :text=>'<div id="dnn_'},

# Hidden input tag name and id # reliable
{:text=>'<input name="__dnnVariable" type="hidden" id="__dnnVariable"'},

# Version Detection # Meta Generator
{ :version=>/<META[^>]+NAME="GENERATOR" CONTENT="DotNetNuke ([\d\.]{1,10})">/i },

# Module Detection # modules are in the path /DesktopModules/xxx
{ :module=>/(href|src)="\/DesktopModules\/([^\/]+)\//, :offset=>1 },

# Copyright year
{ :string=>/<!-- DotNetNuke[^<]*<!-- Copyright \(c\) 2002-([0-9]{4})/ },

]

# Passive #
def passive
	m=[]

	# some sites have this cookie
	m << {:name=>"DotNetNukeAnonymous Cookie" } if @meta["set-cookie"] =~ /DotNetNukeAnonymous=/

	# Return passive matches
	m
end


# An aggressive plugin could use /logo.gif to confirm it's dotnetnuke

end


