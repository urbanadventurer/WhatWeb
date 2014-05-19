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
    description "DotNetNuke is an opensource CMS for Microsoft .Net Homepage: www.dotnetnuke.com. Passively detects modules and the copyright year."

    # More examples :
    # http://dnngallery.net/
    # www.dotnetnuke.com/Products/NewtoDotNetNuke/DotNetNukeShowcaseSites/tabid/541/Default.aspx

    # ShodanHQ reuslts as at 2012-4-19 #
    # 713 for DotNetNukeAnonymous

    # Google results as at 2011-03-06 #
    # 442 for "Powered by dotnetnuke"

    # Dorks #
    dorks [
        '"Powered by dotnetnuke"'
    ]

    # Examples #
    examples %w|
www.wi-ineta.org 173.203.139.170 http://4-h.org/ http://camt.artsnet.org/ http://cnycf.org/cnycf/ http://cuongdang.net/ http://denvergov.com/ http://franchise.littlecaesars.com/ http://jacoby-studio.com/ http://laautoshow.com/Default.aspx http://seablick.com/ http://web.pella.com/ http://wildlandstrust.org/ http://www.4most.co.za/ http://www.activesocial.com http://www.advent1.com/ http://www.alphadeltaphi.org/ http://www.aroundthecreek.com/ http://www.bearmountain.ca/ http://www.bhcri.ca/ http://www.bingway.com/default.aspx http://www.boschhotwater.com/ http://www.bridgersteel.com/ http://www.businessstrategy.com/ http://www.can-trace.org/ http://www.cata.org/ http://www.cdacompass.com/ http://www.cdiradiology.com/ http://www.chewninginspections.com/ http://www.ci.snoqualmie.wa.us/ http://www.clazyu.com/ http://www.collages.net/ http://www.coretrate.com/ http://www.cosis.us/ http://www.dangandvanda.com/ http://www.dnnwerk.de/ http://www.dotnetnukeblogs.com/ http://www.dreamwright.com/ http://www.earsinus.com/ http://www.ecater.com.au/ http://www.edgenet.com/ http://www.edgetrainingsystems.com/ http://www.elcaminohospital.org/ http://www.elevenwireless.com/ http://www.engagesoftware.com/ http://www.engageuniversity.com/ http://www.enterprisebank.com/Home.aspx http://www.esp-net.com/ http://www.forestry.ubc.ca/ http://www.fpcanoagem.pt/ http://www.glowline.co.za/ http://www.golfcoursearchitecture.net/ http://www.graphiksolutions.ca/ http://www.greenisdead.org/ http://www.hamiltoncaster.com/ http://www.indianmotorcycle.com/ http://www.iowacomputergurus.com/ http://www.kingslodgehogsback.co.za/ http://www.lansing.org/ http://www.late.com.br/ http://www.logicspectrum.com/ http://www.lourdes.edu/ http://www.magenic.com/ http://www.maplewoodnursinghome.com/ http://www.maritimebeauty.com/ http://www.meetingstreet.org/ http://www.mentores.net/ http://www.minhphuongvn.com/ http://www.ncazaleafestival.org/ http://www.ncomputing.com/ http://www.neoteo.com/ http://www.odysseynetworks.org/ http://www.onplonge.com/ http://www.onwindows.com/ http://www.plaestanyjove.org/ http://www.poppov.org/ http://www.prnatech.org/ http://www.puredotnetnuke.com/ http://www.r2integrated.com/ http://www.rilisc.org/ http://www.rlg.net/ http://www.rosequarter.com/ http://www.rustconsulting.com/ http://www.sakesocial.com/ http://www.sc4k.org/ http://www.sck.net/ http://www.segway.it/ http://www.skyetek.com/ http://www.spectracomcorp.com/ http://www.stlartworks.org/ http://www.summitconversations.org/ http://www.sunshinelighting.com/ http://www.thousandislandslife.com/ http://www.transperth.wa.gov.au/ http://www.unpan.org/ http://www.visitmo.com/ http://www.windmillroadhouse.co.za/ http://www.wineaustralia.com/australia http://www.workoutbox.com/ http://www.yesmail.com/ http://www.zymmetrical.com/
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

            # DotNetNukeAnonymous Cookie # some sites have this cookie
            { :search=>"headers[set-cookie]", :name=>"DotNetNukeAnonymous Cookie", :regexp=>/DotNetNukeAnonymous=/ },

            # /logo.gif
            { :url=>"/logo.gif", :md5=>"6eef6123d31c45ace6b9003edb34772e" },

    ]

    def aggressive
        m=[]
        versions = Hash[
            "05.06.04" => [
              ["Portals/_default/default.css", "621653870c35f7eb431b9679b39155ee"],
            ],
            "05.06.05" => [
              ["Portals/_default/default.css", "621653870c35f7eb431b9679b39155ee"],
            ],
            "05.06.06" => [
              ["Portals/_default/default.css", "621653870c35f7eb431b9679b39155ee"],
            ],
            "05.06.07" => [
              ["Portals/_default/default.css", "621653870c35f7eb431b9679b39155ee"],
            ],
            "05.06.08" => [
              ["Portals/_default/default.css", "621653870c35f7eb431b9679b39155ee"],
            ],
            "06.00.02" => [
              ["js/Debug/dnncore.js", "2ce987d184050815c0214a72ad6bbc32"],
              ["Portals/_default/default.css", "e69946858f8e210c0e78bb4b8c45ee2f"],
            ],
            "06.01.00" => [
              ["js/Debug/dnncore.js", "2ce987d184050815c0214a72ad6bbc32"],
              ["Portals/_default/default.css", "3e2097fdc7bb717ed9f560ffc7930fbb"],
            ],
            "06.01.01" => [
              ["js/Debug/dnncore.js", "2ce987d184050815c0214a72ad6bbc32"],
              ["Portals/_default/default.css", "3e2097fdc7bb717ed9f560ffc7930fbb"],
            ],
            "06.01.02" => [
              ["js/Debug/dnncore.js", "2ce987d184050815c0214a72ad6bbc32"],
              ["Portals/_default/default.css", "da3990e75233883064b5adde3387ed3c"],
            ],
            "06.01.03" => [
              ["js/Debug/dnncore.js", "065b0515b58277e381ff8b5e788a15c7"],
              ["Portals/_default/default.css", "e4c0494ba357ec864000d1aad72296bb"],
            ],
            "06.01.04" => [
              ["js/Debug/dnncore.js", "909086a04259d01baafbba4cbbf15456"],
              ["Portals/_default/default.css", "a66cc13a301c91d86169b85dfaa8feca"],
            ],
            "06.01.05" => [
              ["js/Debug/dnncore.js", "909086a04259d01baafbba4cbbf15456"],
              ["Portals/_default/default.css", "39d8b4f0877e737abe5dfa5d77ac26f4"],
            ],
            "06.02.00" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "d2064a8bd52f2da618d733c840e60a8e"],
            ],
            "06.02.01" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "d2064a8bd52f2da618d733c840e60a8e"],
            ],
            "06.02.02" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "1eceb4ed64b7b18c0fbd2840b355f3b4"],
            ],
            "06.02.03" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "1eceb4ed64b7b18c0fbd2840b355f3b4"],
            ],
            "06.02.04" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "eaee4aeeb1324a5bacdacba754d0098a"],
            ],
            "06.02.05" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "eaee4aeeb1324a5bacdacba754d0098a"],
            ],
            "06.02.06" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "eaee4aeeb1324a5bacdacba754d0098a"],
            ],
            "06.02.07" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "eaee4aeeb1324a5bacdacba754d0098a"],
            ],
            "06.02.08" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "eaee4aeeb1324a5bacdacba754d0098a"],
            ],
            "06.02.09" => [
              ["js/Debug/dnncore.js", "cf5a1ffa3adc5393155129e5df3b1e59"],
              ["Portals/_default/default.css", "eaee4aeeb1324a5bacdacba754d0098a"],
            ],
            "07.00.00" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "7b98402ead6695f283481957780b5604"],
              ["Portals/_default/Skins/Gravity/skin.css", "d8c286cd45c317b7421ea23047e6db7d"],
              ["Portals/_default/default.css", "d12dd9e07108d0034098caf54c374e11"],
            ],
            "07.00.01" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "7b98402ead6695f283481957780b5604"],
              ["Portals/_default/Skins/Gravity/skin.css", "459c9e1bad3c1f41f837f2fe49bf3086"],
              ["Portals/_default/default.css", "ddf088fc649e684315bb6c52a125c588"],
            ],
            "07.00.02" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "7b98402ead6695f283481957780b5604"],
              ["Portals/_default/Skins/Gravity/skin.css", "459c9e1bad3c1f41f837f2fe49bf3086"],
              ["Portals/_default/default.css", "ddf088fc649e684315bb6c52a125c588"],
            ],
            "07.00.03" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "7b98402ead6695f283481957780b5604"],
              ["Portals/_default/Skins/Gravity/skin.css", "459c9e1bad3c1f41f837f2fe49bf3086"],
              ["Portals/_default/default.css", "b2a0f31d8daff09a10ebbbbdef84186b"],
            ],
            "07.00.04" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "8285fc2cf5068f90bd55b4e3e2e5ed4d"],
              ["Portals/_default/Skins/Gravity/skin.css", "459c9e1bad3c1f41f837f2fe49bf3086"],
              ["Portals/_default/default.css", "923507367030d1a5476c79d44a04e06d"],
            ],
            "07.00.05" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "023ee5fd0fb40159dc857024c4135da9"],
              ["Portals/_default/Skins/Gravity/skin.css", "4ece356287d34733d5339b67cf1e932e"],
              ["Portals/_default/default.css", "68b3eee241236ef9e28dc93638eb7a96"],
            ],
            "07.00.06" => [
              ["js/Debug/dnncore.js", "a12580074341ae84dfbd1f28c025ebd3"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "023ee5fd0fb40159dc857024c4135da9"],
              ["Portals/_default/Skins/Gravity/skin.css", "4ece356287d34733d5339b67cf1e932e"],
              ["Portals/_default/default.css", "68b3eee241236ef9e28dc93638eb7a96"],
            ],
            "07.01.00" => [
              ["js/Debug/dnncore.js", "06d1c09a2130ede2d63330487004157c"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "1fe8462962517638da2ccb6d6449149b"],
              ["Portals/_default/Skins/Gravity/skin.css", "593c2d549f4d84b55af78f6e82dd8a1b"],
              ["Portals/_default/default.css", "5aaf509259a8d3b399ebec913622ddbb"],
            ],
            "07.01.01" => [
              ["js/Debug/dnncore.js", "a7e22fa5f29ac45fa4ad0f883b9a646d"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "580baf3cb55fa208d8d074182101e630"],
              ["Portals/_default/Skins/Gravity/skin.css", "593c2d549f4d84b55af78f6e82dd8a1b"],
              ["Portals/_default/default.css", "13b1624483406fa1a3d08f425f4d9cef"],
            ],
            "07.01.02" => [
              ["js/Debug/dnncore.js", "51817ce8467c78fff821d73b1cb054c6"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "d8e217e66186a2a3ba91fec7702a88de"],
              ["Portals/_default/Skins/Gravity/skin.css", "c3b94b06b928e0190a0c53ad9b11a2b1"],
              ["Portals/_default/default.css", "45b02f15f4ffd181f0b7f23c00b4c285"],
            ],
            "07.02.00" => [
              ["js/Debug/dnncore.js", "51817ce8467c78fff821d73b1cb054c6"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "d8e217e66186a2a3ba91fec7702a88de"],
              ["Portals/_default/Skins/Gravity/skin.css", "bd3478f118d58a5b7a4e524b2b2365b1"],
              ["Portals/_default/default.css", "8f89cfb76352d48e46f2e85bedd83b72"],
            ],
            "07.02.01" => [
              ["js/Debug/dnncore.js", "a7e22fa5f29ac45fa4ad0f883b9a646d"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "98277db6964fcd627a7864143e926ddd"],
              ["Portals/_default/Skins/Gravity/skin.css", "1c1a9675f3e8ab754c932b5c3ec62765"],
              ["Portals/_default/default.css", "d8e5817c53c8f45b952a7026c30176b2"],
            ],
            "07.02.02" => [
              ["js/Debug/dnncore.js", "a7e22fa5f29ac45fa4ad0f883b9a646d"],
              ["admin/Menus/ModuleActions/ModuleActions.js", "98277db6964fcd627a7864143e926ddd"],
              ["Portals/_default/Skins/Gravity/skin.css", "6140110855fd50d5ba3d48ee31599866"],
              ["Portals/_default/default.css", "dfba80f7700262768ab7341c86fa1c86"],
            ],
        ]

            v = Version.new("DNN (DotNetNuke)", versions, @base_uri)

            version = v.matches_format

            # Set version if present
            unless version.empty?
                version.each { |ver|
                    m << {:name => "md5 sums of files", :version => ver}
                }
            end

            # Return aggressive matches
            m
    end

end

