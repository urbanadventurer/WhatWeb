##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-31 #
# Updated regex
##
# Version 0.2 # 2011-01-07 #
# Updated version detection
# Updated matches
# Added model detection
# Added module detection
##
Plugin.define "Axis-Network-Camera" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-29
version "0.2"
description "Axis network camera"
website "http://www.axis.com/"

# Google results as at 2010-06-27 #
# 312 for allintitle: Axis 2.10 OR 2.12 OR 2.30 OR 2.31 OR 2.32 OR 2.33 OR 2.34 OR 2.40 OR 2.42 OR 2.43 "Network Camera"
# 475 for intitle:"Live View / . AXIS" | inurl:view/view.shtml OR inurl:view/indexFrame.shtml | intitle:"MJPG Live Demo" | "intext:Select preset position"
# 23  for inurl:indexFrame.shtml intitle:Axis -inurl

# Dorks #
dorks [
'allintitle: Axis 2.10 OR 2.12 OR 2.30 OR 2.31 OR 2.32 OR 2.33 OR 2.34 OR 2.40 OR 2.42 OR 2.43 "Network Camera"',
'intitle:"Live View / . AXIS" | inurl:view/view.shtml OR inurl:view/indexFrame.shtml | intitle:"MJPG Live Demo" | "intext:Select preset position"',
'inurl:indexFrame.shtml intitle:Axis -inurl'
]



# Matches #
matches [

# Default video server title
{ :text=>'<TITLE>AXIS Video Server</TITLE>' },

# Frameset # Default frame HTML
{ :text=>'<FRAME NAME="WhatEver" SRC="/incl/whatever.shtml" SCROLLING=NO MARGINGHEIGHT=0 MARGINWIDTH=0>' },

# Frameset # Default trash frame
{ :text=>'	<FRAME NAME="Trash" SRC="/view/trash.shtml" SCROLLING=NO MARGINGHEIGHT=0 MARGINWIDTH=0>' },

# Frameset # Default temp frame
{ :text=>'      <FRAME NAME="Temp" SRC="/view/temp.shtml" SCROLLING=NO MARGINGHEIGHT=0 MARGINWIDTH=0>' },

# Default noscript text
{ :text=>'Your browser has JavaScript turned off.<br>For the user interface to work effectively, you must enable JavaScript in your browser and reload/refresh this page.' },

# Default img src
{ :text=>'<img SRC="/pics/AxisLogo.gif" WIDTH="95" HEIGHT="40" BORDER="0" ALIGN="right" ALT="' },

# Model Detection # Default video server title
{ :model=>/<TITLE>Live View \/? - AXIS ([^<]*) Video Server<\/TITLE>/i, :module=>"Live View" },

# Model Detection # Default network camera title
{ :model=>/<TITLE>Axis ([0-9]+)[^<]*Network Camera[^<]*<\/TITLE>/i },

# Version Detection # Default title for AXIS 2000 series
{ :version=>/<TITLE>Axis [0-9]+[^<]*Network Camera ([\d\.]+)<\/TITLE>/i },

# Version Detection # Default live view title for AXIS 200 series
{ :version=>/<TITLE>Live View \/? - AXIS [\da-z]+ [^<]*version ([\d\.]+)<\/TITLE>/i, :module=>"Live View" },

# Model Detection # Default live view title for AXIS 200 series
{ :model=>/<TITLE>Live View \/? - AXIS ([\da-z]+) [^<]*<\/TITLE>/i, :module=>"Live View" },

]

end

