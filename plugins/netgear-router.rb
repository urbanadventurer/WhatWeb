##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.2 # 2011-03-18 #
# Added model detection
##
Plugin.define "Netgear-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.3"
description "Netgear Router - From wireless routers and adapters to Layer 3 Managed Switches we have the networking equipment you need for your home or small business."
website "http://www.netgear.com/products/"

# ShodanHQ results as at 2011-03-18 #
# 22,614 for realm netgear
# 15,516 for realm netgear DG
#    671 for realm netgear WG
#    241 for realm netgear DM



# Matches #
matches [

#{ :model=>'CG814WG', :url=>'/settingsCG814WG.gif', :certainty=>75 },
#{ :model=>'CM212', :url=>'/settingsCM212.gif', :certainty=>75 },
#{ :model=>'DG632', :url=>'/settingsDG632.gif', :certainty=>75 },
#{ :model=>'DG632B', :url=>'/settingsDG632B.gif', :certainty=>75 },
#{ :model=>'DG814', :url=>'/settingsDG814.gif', :certainty=>75 },
#{ :model=>'DG824M', :url=>'/settingsDG824M.gif', :certainty=>75 },
#{ :model=>'DG834', :url=>'/settingsDG834.gif', :certainty=>75 },
#{ :model=>'DG834B', :url=>'/settingsDG834B.gif', :certainty=>75 },
#{ :model=>'DG834G', :url=>'/settingsDG834G.gif', :certainty=>75 },
#{ :model=>'DG834GB', :url=>'/settingsDG834GB.gif', :certainty=>75 },
#{ :model=>'DG834GT', :url=>'/settingsDG834GT.gif', :certainty=>75 },
#{ :model=>'DG834GTB', :url=>'/settingsDG834GTB.gif', :certainty=>75 },
#{ :model=>'DG834GV', :url=>'/settingsDG834GV.gif', :certainty=>75 },
#{ :model=>'dg834N', :url=>'/settingsdg834N.gif', :certainty=>75 },
#{ :model=>'DG834PN', :url=>'/settingsDG834PN.gif', :certainty=>75 },
#{ :model=>'DGFV338', :url=>'/settingsDGFV338.gif', :certainty=>75 },
#{ :model=>'DM111P', :url=>'/settingsDM111P.gif', :certainty=>75 },
#{ :model=>'DM602', :url=>'/settingsDM602.gif', :certainty=>75 },
#{ :model=>'FM114P', :url=>'/settingsFM114P.gif', :certainty=>75 },
#{ :model=>'FR114P', :url=>'/settingsFR114P.gif', :certainty=>75 },
#{ :model=>'FR114W', :url=>'/settingsFR114W.gif', :certainty=>75 },
#{ :model=>'FR314', :url=>'/settingsFR314.gif', :certainty=>75 },
#{ :model=>'FR318', :url=>'/settingsFR318.gif', :certainty=>75 },
#{ :model=>'FR328S', :url=>'/settingsFR328S.gif', :certainty=>75 },
#{ :model=>'FV318', :url=>'/settingsFV318.gif', :certainty=>75 },
#{ :model=>'FVG318', :url=>'/settingsFVG318.gif', :certainty=>75 },
#{ :model=>'FVL328', :url=>'/settingsFVL328.gif', :certainty=>75 },
#{ :model=>'FVM318', :url=>'/settingsFVM318.gif', :certainty=>75 },
#{ :model=>'FVS114', :url=>'/settingsFVS114.gif', :certainty=>75 },
#{ :model=>'FVS124G', :url=>'/settingsFVS124G.gif', :certainty=>75 },
#{ :model=>'FVS318', :url=>'/settingsFVS318.gif', :certainty=>75 },
#{ :model=>'FVS328', :url=>'/settingsFVS328.gif', :certainty=>75 },
#{ :model=>'FVS338', :url=>'/settingsFVS338.gif', :certainty=>75 },
#{ :model=>'FVX538', :url=>'/settingsFVX538.gif', :certainty=>75 },
#{ :model=>'FWAG114', :url=>'/settingsFWAG114.gif', :certainty=>75 },
#{ :model=>'FWG114P', :url=>'/settingsFWG114P.gif', :certainty=>75 },
#{ :model=>'GA302T', :url=>'/settingsGA302T.gif', :certainty=>75 },
#{ :model=>'GA311', :url=>'/settingsGA311.gif', :certainty=>75 },
#{ :model=>'GA511', :url=>'/settingsGA511.gif', :certainty=>75 },
#{ :model=>'GA620', :url=>'/settingsGA620.gif', :certainty=>75 },
#{ :model=>'GA621', :url=>'/settingsGA621.gif', :certainty=>75 },
#{ :model=>'GA622T', :url=>'/settingsGA622T.gif', :certainty=>75 },
#{ :model=>'HE102', :url=>'/settingsHE102.gif', :certainty=>75 },
#{ :model=>'HR314', :url=>'/settingsHR314.gif', :certainty=>75 },
#{ :model=>'JFS516', :url=>'/settingsJFS516.gif', :certainty=>75 },
#{ :model=>'JFS524', :url=>'/settingsJFS524.gif', :certainty=>75 },
#{ :model=>'JFS524F', :url=>'/settingsJFS524F.gif', :certainty=>75 },
#{ :model=>'JGS516', :url=>'/settingsJGS516.gif', :certainty=>75 },
#{ :model=>'JGS524', :url=>'/settingsJGS524.gif', :certainty=>75 },
#{ :model=>'JGS524F', :url=>'/settingsJGS524F.gif', :certainty=>75 },
#{ :model=>'KWGR614', :url=>'/settingsKWGR614.gif', :certainty=>75 },
#{ :model=>'ME101', :url=>'/settingsME101.gif', :certainty=>75 },
#{ :model=>'ME102', :url=>'/settingsME102.gif', :certainty=>75 },
#{ :model=>'ME103', :url=>'/settingsME103.gif', :certainty=>75 },
#{ :model=>'MR314', :url=>'/settingsMR314.gif', :certainty=>75 },
#{ :model=>'MR814', :url=>'/settingsMR814.gif', :certainty=>75 },
#{ :model=>'RH340', :url=>'/settingsRH340.gif', :certainty=>75 },
#{ :model=>'RH348', :url=>'/settingsRH348.gif', :certainty=>75 },
#{ :model=>'RM356', :url=>'/settingsRM356.gif', :certainty=>75 },
#{ :model=>'RO318', :url=>'/settingsRO318.gif', :certainty=>75 },
#{ :model=>'RP114', :url=>'/settingsRP114.gif', :certainty=>75 },
#{ :model=>'RP334', :url=>'/settingsRP334.gif', :certainty=>75 },
#{ :model=>'RP614', :url=>'/settingsRP614.gif', :certainty=>75 },
#{ :model=>'RT311', :url=>'/settingsRT311.gif', :certainty=>75 },
#{ :model=>'RT314', :url=>'/settingsRT314.gif', :certainty=>75 },
#{ :model=>'RT328', :url=>'/settingsRT328.gif', :certainty=>75 },
#{ :model=>'RT338', :url=>'/settingsRT338.gif', :certainty=>75 },
#{ :model=>'WAB102', :url=>'/settingsWAB102.gif', :certainty=>75 },
#{ :model=>'WAG102', :url=>'/settingsWAG102.gif', :certainty=>75 },
#{ :model=>'WAG302', :url=>'/settingsWAG302.gif', :certainty=>75 },
#{ :model=>'WAGL102', :url=>'/settingsWAGL102.gif', :certainty=>75 },
#{ :model=>'WAGR614', :url=>'/settingsWAGR614.gif', :certainty=>75 },
#{ :model=>'WG102', :url=>'/settingsWG102.gif', :certainty=>75 },
#{ :model=>'WG111', :url=>'/settingsWG111.gif', :certainty=>75 },
#{ :model=>'WG111T', :url=>'/settingsWG111T.gif', :certainty=>75 },
#{ :model=>'WG302', :url=>'/settingsWG302.gif', :certainty=>75 },
#{ :model=>'WG311', :url=>'/settingsWG311.gif', :certainty=>75 },
#{ :model=>'WG602', :url=>'/settingsWG602.gif', :certainty=>75 },
#{ :model=>'WGE101', :url=>'/settingsWGE101.gif', :certainty=>75 },
#{ :model=>'WGE111', :url=>'/settingsWGE111.gif', :certainty=>75 },
#{ :model=>'WGL102', :url=>'/settingsWGL102.gif', :certainty=>75 },
#{ :model=>'WGM124', :url=>'/settingsWGM124.gif', :certainty=>75 },
#{ :model=>'WGR101', :url=>'/settingsWGR101.gif', :certainty=>75 },
#{ :model=>'WGR614', :url=>'/settingsWGR614.gif', :certainty=>75 },
#{ :model=>'WGT624', :url=>'/settingsWGT624.gif', :certainty=>75 },
#{ :model=>'WGT624SC', :url=>'/settingsWGT624SC.gif', :certainty=>75 },
#{ :model=>'WGT634U', :url=>'/settingsWGT634U.gif', :certainty=>75 },
#{ :model=>'WGU624', :url=>'/settingsWGU624.gif', :certainty=>75 },
#{ :model=>'WGX102', :url=>'/settingsWGX102.gif', :certainty=>75 },
#{ :model=>'WN121T', :url=>'/settingsWN121T.gif', :certainty=>75 },
#{ :model=>'WN311B', :url=>'/settingsWN311B.gif', :certainty=>75 },
#{ :model=>'WN311T', :url=>'/settingsWN311T.gif', :certainty=>75 },
#{ :model=>'WN511B', :url=>'/settingsWN511B.gif', :certainty=>75 },
#{ :model=>'WN511T', :url=>'/settingsWN511T.gif', :certainty=>75 },
#{ :model=>'WN802T', :url=>'/settingsWN802T.gif', :certainty=>75 },
#{ :model=>'WNR834B', :url=>'/settingsWNR834B.gif', :certainty=>75 },
#{ :model=>'WNR834M', :url=>'/settingsWNR834M.gif', :certainty=>75 },
#{ :model=>'WNR854T', :url=>'/settingsWNR854T.gif', :certainty=>75 },
#{ :model=>'WPN802', :url=>'/settingsWPN802.gif', :certainty=>75 },
#{ :model=>'WPN824', :url=>'/settingsWPN824.gif', :certainty=>75 },
#{ :model=>'XM128', :url=>'/settingsXM128.gif', :certainty=>75 },

# WWW-Authenticate Header
{ :regexp=>/^Basic realm="?[\s]*Netgear/, :certainty=>75, :search=>"headers[www-authenticate]" },

# WWW-Authenticate Header # Model Detection
{ :model=>/^Basic realm="?[\s]*NETGEAR ([^"]+)[\s]*"?/, :certainty=>75, :search=>"headers[www-authenticate]" },

]

end

