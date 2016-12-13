##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Centreon" do
    author "Brendan Coles <bcoles@gmail.com>" # 2011-11-09
    version "0.2"
    description "Centreon is a network, system, applicative supervision and monitoring tool, it is based upon Nagios."
website "http://www.centreon.com/"

    # Google results as at 2011-11-11 #
    # 50 for intitle:"Centreon - IT & Network Monitoring" "Centreon Logo"
    #  4 for inurl:"centreon/main.php"

    # Dorks #
    dorks [
        'intitle:"Centreon - IT & Network Monitoring" "Centreon Logo"'
    ]

    # Matches #
    matches [

    # Login Page # Year Detection # Meta Generator
        { :string=>/<meta name="Generator" content="Centreon - Copyright \(C\) 2005 - (20[\d]{2}) Open Source Matters\. All rights reserved\." \/>/ },

    # Login Page # Year Detection # td id="LoginInvitcpy"
        { :string=>/<td id="LoginInvitcpy" colspan="2"><br \/>&copy; 2005-(20[\d]{2}) <a href="mailto:infos@centreon\.com">Centreon<\/a><\/td>/ },

    # Login Page # Logo HTML
        { :text=>'<td class="LoginInvitLogo" colspan="2"><img src="img/centreon.gif" alt="Centreon Logo" title="Centreon Logo" style="" /></td>' },

    # Login Page # Version Detection
        { :version=>/<tr>[\s]+<td class="LoginInvitVersion"><br \/>[\s]+([^\s^<]+)[\s]+<\/td>[\s]+<td class="LoginInvitDate"><br \/>/ },

    ]

    def aggressive
        m = []

        versions = Hash[
                        "1.4.1" =>
                        [["include/common/javascript/functions.js",
                          "09937072e56b15c00406cd463e408e78"],
                         ["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "4b657d56eb66b6c76de6308fb7b6ed17"]],
                        "1.4.2" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "4b657d56eb66b6c76de6308fb7b6ed17"]],
                        "1.4.2.1" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "4b657d56eb66b6c76de6308fb7b6ed17"]],
                        "1.4.2.2" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "4b657d56eb66b6c76de6308fb7b6ed17"]],
                        "1.4.2.3" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "4b657d56eb66b6c76de6308fb7b6ed17"]],
                        "1.4.2.4" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "9ecebc30b3796242eb1c971dd13eb5e3"]],
                        "1.4.2.5" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "9ecebc30b3796242eb1c971dd13eb5e3"]],
                        "1.4.2.6" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "9ecebc30b3796242eb1c971dd13eb5e3"]],
                        "1.4.2.7" =>
                        [["include/monitoring/status/templates/serviceSchedule.ihtml",
                          "9ecebc30b3796242eb1c971dd13eb5e3"]],
                        "1.4.2.8" =>
                        [["include/views/graphs/graphODS/graphODSByHost.ihtml",
                          "44c6fa0c23e3ec470ae0675e07a64711"]],
                        "2.0" =>
                        [["include/monitoring/status/status-ndo/templates/metaService.xsl",
                          "ea4c470d4b394ad94a048892172a6e0d"]],
                        "2.0.1" =>
                        [["include/configuration/configResources/listResources.ihtml",
                          "47a71373ea0ffc719f27df78d37b2673"]],
                        "2.0.2" =>
                        [["include/common/javascript/functions.js",
                          "795243ce2f7c4ae08c1e441ee537ba65"]],
                        "2.1" =>
                        [["include/configuration/configObject/host/listHost.ihtml",
                          "2dc3be403ade882bb329def8039c0dfb"]],
                        "2.1.1" =>
                        [["include/configuration/configObject/host/listHost.ihtml",
                          "2dc3be403ade882bb329def8039c0dfb"]],
                        "2.1.2" =>
                        [["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"]],
                        "2.1.3" =>
                        [["include/monitoring/status/Services/xsl/service.xsl",
                          "a91d4421eece22b984d52c2dde9da4fb"],
                         ["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"]],
                        "2.1.4" =>
                        [["include/monitoring/status/Services/xsl/service.xsl",
                          "301b8f822cad37711e8f6bdbbb01d27d"],
                         ["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"]],
                        "2.1.5" =>
                        [["include/monitoring/objectDetails/template/serviceDetails.ihtml",
                          "50545ce4bcd327be9cac22f0b76e9627"],
                         ["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"]],
                        "2.1.6" =>
                        [["include/monitoring/objectDetails/template/serviceDetails.ihtml",
                          "92a8fa33943a18aa87ad7c17b5357c81"],
                         ["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"]],
                        "2.1.7" =>
                        [["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"]],
                        "2.1.8" =>
                        [["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"],
                         ["Themes/Centreon-2/style.css",
                          "c5ea4a47743e8296b7b2a833d2366b30"]],
                        "2.1.9" =>
                        [["include/configuration/configObject/service/listService.ihtml",
                          "102dabd2a494e4c5a5813db808d98b6b"],
                         ["include/configuration/configObject/host/listHost.ihtml",
                          "87e104f0287a280fef1194dd60cd2855"],
                         ["Themes/Centreon-2/style.css",
                          "c5ea4a47743e8296b7b2a833d2366b30"]],
                        "2.1.10" =>
                        [["Themes/Centreon-2/style.css",
                          "c5ea4a47743e8296b7b2a833d2366b30"],
                         ["include/home/tacticalOverview/tacticalOverview.ihtml",
                          "a2a13e046acb7e84dae8e1fe5f52e43e"]],
                        "2.1.11" =>
                        [["Themes/Centreon-2/style.css",
                          "c5ea4a47743e8296b7b2a833d2366b30"],
                         ["include/home/tacticalOverview/tacticalOverview.ihtml",
                          "4071ef8a8f0a555ceedb43c850ae2e7a"]],
                        "2.1.12" =>
                        [["Themes/Centreon-2/style.css",
                          "f81f143277155ea383276da090504e2b"]],
                        "2.1.13" =>
                        [["Themes/Centreon-2/style.css",
                          "f81f143277155ea383276da090504e2b"]],
                        "2.2.0" =>
                        [["include/common/javascript/xslt.js",
                          "747cf39e51507829fe7dfba73ae07bd6"]],
                        "2.2.1" =>
                        [["include/common/javascript/xslt.js",
                          "6f24fcbbd09c0ecf8c0f32a9473ecbfc"]],
                        "2.2.2" =>
                        [["include/common/javascript/xslt.js",
                          "6f24fcbbd09c0ecf8c0f32a9473ecbfc"]],
                        "2.3.0" =>
                        [["install/install.css",
                          "cdda9ffedc1d9a8677ef852daf24353c"],
                         ["include/configuration/configObject/service/listService.ihtml",
                          "670398d91d02092025a1adc8ec3c552d"],
                         ["include/options/accessLists/actionsACL/formActionsAccess.ihtml",
                          "53ccb52eff95b5d16f8c0a3461484603"]],
                        "2.3.1" =>
                        [["include/configuration/configObject/service/listService.ihtml",
                          "670398d91d02092025a1adc8ec3c552d"],
                         ["include/options/accessLists/actionsACL/formActionsAccess.ihtml",
                          "53ccb52eff95b5d16f8c0a3461484603"]],
                        "2.3.2" =>
                        [["include/configuration/configObject/service/listService.ihtml",
                          "e24ae26743857397fb30436d4fde63c8"],
                         ["include/configuration/configObject/service/listService.ihtml",
                          "1229b0d0bb71137b6687801937133f4b"],
                         ["include/configuration/configLoad/formLoadFiles.ihtml",
                          "bd699e606bcc933ac5879279c1d4d2b8"]],
                        "2.3.3" =>
                        [["include/configuration/configObject/service/listService.ihtml",
                          "e24ae26743857397fb30436d4fde63c8"],
                         ["include/configuration/configLoad/formLoadFiles.ihtml",
                          "bd699e606bcc933ac5879279c1d4d2b8"]],
                        "2.3.4" =>
                        [["include/configuration/configObject/service/formService.ihtml",
                          "0ef9f37123c715e760f4159b6b5cff45"],
                         ["include/configuration/configLoad/formLoadFiles.ihtml",
                          "4a4968a7d3b14f73c364a1859167ef89"]],
                        "2.3.8" =>
                        [["include/configuration/configLoad/formLoadFiles.ihtml",
                          "4a4968a7d3b14f73c364a1859167ef89"]],
                        "2.3.9" =>
                        [["include/views/graphs/graph.xsl",
                          "7cb9c6a65ad914c90f2ab7434f39e381"],
                         ["include/configuration/configLoad/formLoadFiles.ihtml",
                          "4a4968a7d3b14f73c364a1859167ef89"]],
                        ]
        v = Version.new("Centreon", versions, @base_uri)

        version = v.matches_format
  
	    # Return version matches from md5 hashes, if present
	    unless version.empty?
            version.each { |ver|
                m << {:name => "MD5 sums", :version => ver}
            }
	    end	
    
        # Return aggressive matches
        m
    end
end

