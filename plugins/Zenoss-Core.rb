##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zenoss-Core" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-01-29
version "0.1"
description "Zenoss (Zenoss Core) is an open-source application, server, and network management platform based on the Zope application server. - Homepage: http://sourceforge.net/projects/zenoss/"

# Google results as at 2012-01-29 #
# 27 for intitle:"Login" inurl:"zport" "Zenoss, Inc." "Version"
# 81 for intitle:"Login" "Copyright" "Zenoss, Inc." "Version"

# Dorks #
dorks [
'intitle:"Login" inurl:"zport" "Zenoss, Inc." "Version"'
]

# Examples #
examples %w|
zenoss.wvnoc.com:8080
zenoss.sea5.speakeasy.net:8080/zport/dmd/Devices/rrdTemplates/ethernetCsmacd
zenoss.miniclip.com:8080/zport/dmd/
zenoss.blastro.com:8080
zenoss.santepediatrics.com:8080
serah.fp.hamzahkhan.com/zport/acl_users/cookieAuthHelper/login_form
https://poblano.uits.indiana.edu/zport/acl_users/cookieAuthHelper/login_form
https://zenoss.stanford.edu/
https://zenoss.saas.appdynamics.com/
https://zenoss.sixfeetup.com/
https://zenoss.hosted.exlibrisgroup.com/ 
https://servicemon.mtu.edu/zport/dmd/Services/IpService/Privileged/serviceclasses/snmp
https://ccls.sfsu.edu:8080/zport/acl_users/
https://poblano.uits.indiana.edu/zport/acl_users/
|

# Matches #
matches [

# Login Page # Copyright footer # Version Detection
{ :version=>/<div id="copyright">[\s]+<p>Copyright &copy; 2005-20[\d]{2} Zenoss, Inc\. \| Version[\s]+<span>([^\s^<]+)<\/span>[\s]+/ },

# Login Page # favicon HTML
{ :text=>'<link rel="shortcut icon" type="image/x-icon" href="/zport/dmd/favicon.ico" />' },

]

end

