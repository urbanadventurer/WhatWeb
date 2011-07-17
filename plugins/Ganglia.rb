##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Ganglia" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "Ganglia is a scalable distributed monitoring system for high-performance computing systems such as clusters and Grids. It is based on a hierarchical design targeted at federations of clusters. It leverages widely used technologies such as XML for data representation, XDR for compact, portable data transport, and RRDtool for data storage and visualization. - Homepage: http://ganglia.sourceforge.net/"

# 118 for intitle:"Ganglia:: Cluster Report" "Cluster Report for"
# 94 for intitle:"Ganglia" "Nodes colored by 1-minute load" +legend

# Dorks #
dorks [
'intitle:"Ganglia:: Cluster Report" "Cluster Report for"'
]

# Examples #
examples %w|
194.44.31.130
143.50.154.21
118.144.126.164
brux.hep.brown.edu/ganglia/
www.vital-it.ch/prdpub/ganglia-webfrontend/
www.emanicslab.org/ganglia/
iceman.cs.ucsb.edu/ganglia/
beowulf.ac.brocku.ca/ganglia/
ferrari.phys.cmu.edu/ganglia/
www.citysense.net/ganglia/
aii.irisa.fr/ganglia/
lovejoy.nerc-essc.ac.uk/ganglia_ClusterGrid/
application.sb-roscoff.fr/ganglia/
mastercluster1.lsi.upc.edu/ganglia/
hcc.unl.edu/ganglia/
csdms.colorado.edu/ganglia/
climserv.ipsl.polytechnique.fr/ganglia/
orbit.psi.edu/ganglia/
qcd.phys.cmu.edu/ganglia/
sparrowhawk.cnbc.cmu.edu/ganglia/
hydra.ft.uam.es/ganglia/
hpc.icrisat.cgiar.org/ganglia/
castl.cs.columbia.edu/ganglia/
cluster.uta.edu/ganglia/
astrosphere.dartmouth.edu/ganglia/
borelli.me.udel.edu/ganglia/
monitor.millennium.berkeley.edu
meta.rocksclusters.org/ganglia/
spl.mit.edu/ganglia/
tmku211.ctw.utwente.nl/ganglia/
njal.physics.sunysb.edu/ganglia/
gbio-pbil.ibcp.fr/ganglia_grisbi/
hpc.ufl.edu/ganglia-phase4/
monitor.millennium.berkeley.edu/index.php
msg.its.monash.edu.au/ganglia/
iceman.cs.ucsb.edu/ganglia/
qcd.phys.cmu.edu/ganglia/
siber.cankaya.edu.tr/boron-ganglia/
green.ssi.swin.edu.au/ganglia/
www.clusters.arc.georgetown.edu/statistics/
watcher.sc.fsu.edu/ganglia/
emperor.cse.psu.edu/ganglia/
t2srv0013.cmsaf.mit.edu/ganglia/
spl.mit.edu/ganglia/
galileo.phys.virginia.edu:8000/ganglia/
homer.astro.sunysb.edu/ganglia/
monitor.na.infn.it:7778/ganglia/
nicadd.niu.edu/ganglia/
boot.chtc.wisc.edu/ganglia/
mastercluster1.lsi.upc.edu/ganglia/
qcd.phys.cmu.edu/ganglia/
www.psychiatry.uiowa.edu/ganglia/
umiss001.hep.olemiss.edu/ganglia/
wing.comp.nus.edu.sg/ganglia/
|

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

