##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenNMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-04-25
version "0.1"
description "OpenNMS - Enterprise-Grade Network Management Application Platform - Homepage: http://www.opennms.com/"

# Source: http://sourceforge.net/projects/opennms/
# Default Port: 8980
# Default Login: admin/admin

# Google results as at 2012-04-25 #
# 25 for intitle:"OpenNMS Web Console" "User" "Password" "OpenNMS Copyright"

# Dorks #
dorks [
'intitle:"OpenNMS Web Console" "User" "Password" "OpenNMS Copyright"'
]

# Examples #
examples %w|
demo.opennms.org
demo.opennms.com/opennms/index.jsp
mephesto.internal.opennms.com/
onms.oregonstate.edu:8980/opennms/index.jsp
monitor2.mossapp.com
nms.boxed.no
zonaopennms.unne.edu.ar:8980/opennms/index.jsp
nms.datasync.com:8080/opennms/acegilogin.jsp
www.chathamfreelists.com
www.chathamlists.com
git.opennms.org
watchdog.nmmu.ac.za
baip2.elearndesign.org
96.10.7.245
64.61.100.14:8980/opennms/index.jsp
208.71.28.4:8980/opennms/
https://opennms.fasthost.no:8443/opennms/index.jsp
https://support.smartvoice.telepacific.com/opennms/
https://nms2.net.lsu.edu/opennms/
https://smyrna.krupczak.org:8443/opennms/
https://shemp.academ.com/opennms/index.jsp
https://nms.velocitynetworks.co.nz:8443/opennms/index.jsp
https://dashboard.mochimedia.net/opennms/index.jsp
https://opennms.camosun.bc.ca:8443/
|

# Matches #
matches [

# Login Page # Logo HTML
{ :regexp=>/<h1 id="headerlogo"><a href="[^"]*index\.jsp"><img src="[^"]*images\/logo\.png" alt="OpenNMS Web Console Home"\/><\/a><\/h1>/ },

# Login Page # Footer # Year Detection
{ :string=>/<p>\s+OpenNMS <a href="(support|help)\/about\.jsp">Copyright<\/a> &copy; 2002-(20[\d]{2})\s+/, :offset=>1 },

# Login Page # Remember me link
{ :regexp=>/<p><input type="checkbox" name="_(spring|acegi)_security_remember_me"> Don't ask for my password for two weeks<\/p>/ },

]

end

