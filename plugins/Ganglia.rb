##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ganglia" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "Ganglia is a scalable distributed monitoring system for high-performance computing systems such as clusters and Grids. It is based on a hierarchical design targeted at federations of clusters. It leverages widely used technologies such as XML for data representation, XDR for compact, portable data transport, and RRDtool for data storage and visualization."
website "http://ganglia.sourceforge.net/"

# 118 for intitle:"Ganglia:: Cluster Report" "Cluster Report for"
# 94 for intitle:"Ganglia" "Nodes colored by 1-minute load" +legend

# Dorks #
dorks [
'intitle:"Ganglia:: Cluster Report" "Cluster Report for"'
]



# Matches #
matches [

# Default title
{ :text=>'<TITLE>Ganglia:: Cluster Report</TITLE>' },

# Legend link
{ :text=>'(Nodes colored by 1-minute load) | <A HREF="./node_legend.html">Legend</A>' },

# Metric select
{ :text=>'<B>Metric</B>&nbsp;&nbsp;<SELECT NAME="m" OnChange="ganglia_form.submit();">' },

# Version Detection # Frontend # Footer
{ :version=>/<CENTER>\n<FONT SIZE="-1" class=footer>\n(Gmetad|Ganglia) Web Frontend version ([\d\.]+)\n<A HREF="http:\/\/ganglia\.sourceforge\.net\/downloads\.php\?component=ganglia-webfrontend&amp;\nversion=[\d\.]+">Check for Updates\.<\/A><BR>\n/, :offset=>1 },

# Version Detection # Backend # Footer
{ :version=>/Web Backend <i>\(gmetad\)<\/i> version ([\d\.]+)\n<A HREF="http:\/\/ganglia\.sourceforge\.net\/downloads\.php\?component=gmetad&amp;\nversion=[\d\.]+">Check for Updates\.<\/A><BR>/, :offset=>1 },

]

end

