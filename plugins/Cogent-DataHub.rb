##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Cogent-DataHub" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-15
version "0.1"
description "Cogent DataHub - real-time data monitoring. DataHub WebView is a Silverlight application"
website "http://www.cogentdatahub.com/"



# Matches #
matches [

# The filename may contain a datestamp in the form of YYMMDD?
# /images/071213_Welcome.gif
#{:url=>"/images/071213_Welcome.gif", :md5=>"6f0d4abcdc79b735ea4b3db4db1c0751"},
# /images/110324_Welcome.png
#{:url=>"/images/110324_Welcome.png", :md5=>"4c2255e141e04e196f534b89956a6635"},

# /images/Cogent.gif
{ :url=>"/images/Cogent.gif", :md5=>"c8f57d665418321b0248c22cd65efaff" },

# /scripts/livedata.js # JavaScript
{:url=>"/scripts/livedata.js", :text=>'timerID = setTimeout ("DataHubConnection.updateTimer()", this.timerTick);' },

# StyleSheet
{ :text=>'<link type="text/css" rel="stylesheet" href="css/dhwebserver.css" />' },

# Logo
{ :text=>'<img src="images/Cogent.gif" alt="" width="449" height="47" border="0">' },

# HTML Comment
{ :text=>'<!-- The DataHub script that determines if the DataPid is running is at the top of this file. The DataHub script is not visable' },

# Title
{ :certainty=>25, :text=>'<title>Cogent DataHub WebView</title>' },

# HTML Comment
{ :text=>'<!-- The following ASP code generates the table of DataHub point values -->' },

]

end

