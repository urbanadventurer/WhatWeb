##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Siemens-Simatic" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "SCADA - Siemens Simatic"
website "http://www.automation.siemens.com/mcms/topics/en/simatic/Pages/Default.aspx"

# SIMATIC HMI - Homepage: http://www.automation.siemens.com/mcms/automation/en/human-machine-interface/Pages/Default.aspx
# SIMATIC NET - Homepage: http://www.automation.siemens.com/mcms/topics/en/simatic/industrial-communications/Pages/redi.aspx
# SIMATIC PCS7 - Homepage: http://www.automation.siemens.com/mcms/topics/en/simatic/process-control-systems/Pages/redi.aspx

# ShodanHQ results as at 2011-03-07 #
# 9  for Simatic -S7 HMI
# 13 for SIMATIC NET -S7 -HMI
# 13 for "Simatic S7"



# Matches #
matches [

################################################################################
# SIMATIC HMI
################################################################################

# /Default.html # Homepage Redirect
{ :url=>"/Default.html", :text=>'<META HTTP-EQUIV="refresh" content="0;URL=/www/start.html">' },

# Default Title
{ :url=>"/www/start.html", :text=>'<title> Miniweb Start Page </title>' },

# Default logo HTML
{ :text=>'<img src="/Images/Siemens_Firmenmarke.gif" alt="Siemens" border="0"></td>' },

# Default font tag + HTML Comment # Appears on all pages
{ :text=>'<font color="#ffffff"> <!-- font ist da, um bei einer Anzeige OHNE CSS nicht schwarz auf schwarz anzuzeigen -->', :model=>"HMI" },

# Default Logo
{ :url=>"/Images/Siemens_Firmenmarke.gif", :md5=>"09539daf4dfe27a0157040eb83570ee5", :model=>"HMI" },

# Module Detection
{ :module=>/	<tr><td class="sph_td"><b>Device Type<\/b><\/td><td class="sph_td">([^<]+)&nbsp;<\/td><\/tr>/ },

# Firmware Detection
{ :firmware=>/	<tr><td class="sph_td"><b>Image version<\/b><\/td><td class="sph_td">([^<]+)&nbsp;<\/td><\/tr>/ },

# Hostname Detection
{ :string=>/	<tr><td class="sph_td"><b>Device Name<\/b><\/td><td class="sph_td">([^<]+)&nbsp;<\/td><\/tr>/ },

# Best SCADA design ever
{ :model=>"HMI", :text=>"Hint:<br> When the devicename contains an underscore ( _ ) some browsers have a bug that makes it impossible to log in.<br> One possible solution may be to use the IP address of the device instead of the name, or to use another browser." },


################################################################################
# SIMATIC NET
################################################################################

# Default Title
{ :text=>'<title>SIMATIC NET IT-CP</title>', :model=>"NET" },

# Default Logo
{ :url=>"/home/siemens.gif", :md5=>"ecfe2d0a8a1e5dba82120f10f119e327", :model=>"NET" },
{ :url=>"/home/itcp.gif", :md5=>"6f3ad9cac1c0ffb5ba09de040752d7ca7", :model=>"NET" },

# Module Detection
{ :url=>"/__Additional", :module=>/<HTML><HEAD><TITLE>([^<]+) Server Information<\/TITLE><\/HEAD>/ },
{ :url=>"/__Additional", :module=>/<TABLE BORDER=2><TR><TD><B>Device-Name: <\/B><\/TD><TD>([^<]+)<\/TD><\/TR>/ },

# Firmware Detection
{ :url=>"/__Additional", :firmware=>/<TR><TD><B>Firmware-Version: <\/B><\/TD><TD>V([\d\.]+)<\/TD><\/TR>/ },


################################################################################
# SIMATIC PCS7
################################################################################

# Model Logo
{ :text=>'<td class="Login_Area" colspan="2"><img src="/SIMATIC_CONTROLLER.png" alt="Simatic S7 CP"></td>', :model=>"PCS 7" },

# Logo HTML
{ :text=>'<td><img src="/Siemens_Firmenmarke_Header.gif" alt="Siemens" border="0"></td>', :model=>"PCS 7" },

# Default Logo
{ :url=>"/Siemens_Firmenmarke_Header.gif", :md5=>"157e8a1ebe2786f2e10346d9f518bb99", :model=>"PCS 7" },

# Default CSS
{ :text=>'<link rel="stylesheet" type="text/css" href="/S7Web.css">' },

# Menu Link
{ :text=>'<td class="MainMenu_Navigation_Level1"><a class="MainMenu_Navigation_Text_Level1" href=\'Portal5000.htm\'>PROFINET IO</a></td>', :model=>"PCS 7" },

# Hostname Detection
{ :url=>"/Portal0000.htm", :string=>/<tr>[\r\n\s]*<td class="static_field">Station name:<\/td>[\r\n\s]*<td class="output_field_long">([^<]+)<\/td>/ },

# Module Detection
{ :url=>"/Portal0000.htm", :module=>/<tr>[\r\n\s]*<td class="static_field">Module name:<\/td>[\r\n\s]*<td class="output_field_long">([^<]+)<\/td>/ },
{ :url=>"/Portal0000.htm", :module=>/<tr>[\r\n\s]*<td class="static_field">Module type:<\/td>[\r\n\s]*<td class="output_field_long">([^<]+)<\/td>/ },

]

end


