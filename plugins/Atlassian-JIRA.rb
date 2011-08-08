##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Atlassian-JIRA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-11
version "0.1"
description "JIRA provides issue tracking and project tracking for software development teams to improve code quality and the speed of development. - Homepage: http://www.atlassian.com/software/jira/"

# Google results as at 2011-07-11 #
# 494 for "Bug tracking and project tracking for software development powered by Atlassian JIRA" "Warning: either you have javascript disabled or your browser does not support javascript"

# ShodanHQ results as at 2011-07-11 #
# 1,977 for x-arequestid
#   759 for x-ausername
#    76 for atlassian.xsrf.token

# Dorks #
dorks [
'"Bug tracking and project tracking for software development powered by Atlassian JIRA" "Warning: either you have javascript disabled or your browser does not support javascript"'
]

# Examples #
examples %w|
jira.atlassian.com
support.atlassian.com
issues.library.cornell.edu
bugreports.qt.nokia.com
helpdesk.saltbushgroup.com
jira.csitx.com:9293
jira.trifork.com
jira.edsd.ru
jira.skunkworks.vn
jira.silverrailtech.net
jira.calidris.com
jazzvm.net:8080
support.e-man.se
www.analogical.com
allprojects.info
bugs.clickability.com
https://hub.connextions.com:8443
support.polopoly.com/jira/
adamevepoker.biz
jira.gliffy.com
support.webperformance.com
jira.datameer.com
jira.oceanobservatories.org
jira.comdivision.com
jira.telenity.com
jira.mpdl.mpg.de
bugs.dlib.indiana.edu
jira.xpeqt.com
radar.oneforge.mq.edu.au
support.streambase.com
projects.solverusa.com
jira.skype.com
jira.misd.isi.edu
jira.bulletinwireless.net
support.warnerbros.com/jira/
cases.groundworkopensource.com
jira.ruedenet.net
bugtracker.vmd.citrix.com
support.calleocrm.com
jira.ruedenet.net
support.assia-inc.com/jira/	
jira.services.logica.com
issues.rpath.com
jira.myassetarena.com
jira.ml-arge.com
jira.hbsp.harvard.edu
jira.gape.bg
jira.isitedesign.com
jira.opinionlab.com
jira.nivallab.com
jira.nanocoding.com
jira.netacad.net
jira.attensity.com
support.thebmsgroup.com.au
jira.oucs.ox.ac.uk
65.216.217.68
jira.shanti.virginia.edu
audio-jira.avid.com
jira.bic-media.com
demo41.structure.almworks.com
jira.appfusions.com
jira.hsd.com.au
jira.millenniumwow.com:8080
www.codecompany.org
jira-rmsis.optimizory.com
jira.majitek.com
issues.m2mop.net
jira.bricket.org
entrack.enfoldsystems.com
open.med.harvard.edu/jira/
jira.vetview.org
jira.c3solutions.com
support.kaazing.com
trac.encuesta.me
https://jira.atica.um.es/jira/
https://jira.atosworldline.com
www.govdex.gov.au/jira/
eajira.gsa.gov
jira.grantsolutions.gov
nrcportal.ahrq.gov/support/
ncbijira.ncbi.nlm.nih.gov
www.anbg.gov.au/jira/
ccrjira.cancer.gov
jira.dec.wa.gov.au
https://sstmacro.ca.sandia.gov:8443/
https://jplis-ahs-003.jpl.nasa.gov:5843/jira/
|

# Matches #
matches [

# noscript
{ :text=>"<noscript><h1>Warning: either you have javascript disabled or your browser does not support javascript. To work properly, this page requires javascript to be enabled.</h1></noscript>" },

# Powered by link
{ :text=>'<a class="seo-link" href="http://www.atlassian.com/software/jira/bug-tracking.jsp">Bug tracking</a> and <a class="seo-link" href="http://www.atlassian.com/software/jira/tour/project-tracking.jsp">project tracking</a> for <a class="seo-link" href="http://www.atlassian.com/software/jira/tour/software-development.jsp">software development</a> powered by <a href="http://www.atlassian.com/software/jira" class="smalltext">Atlassian JIRA</a>' },

# Version Detection # Footer
{ :version=>/<span id="footer-build-information"  style="color: #666666;" >\(([^\)^\s]+)\)<\/span>/ },

# Meta Decorator
{ :text=>'<meta name="decorator" content="atl.general">' },

]

# Passive #
def passive
	m=[]

	# x-arequestid
	m << { :name=>"x-arequestid header" } if @headers["x-arequestid"] =~ /^[\d]+x[\d]+x[\d]+$/

	# x-ausername
	m << { :name=>"x-ausername header" } unless @headers["x-ausername"].nil?

	# atlassian.xsrf.token cookie
	m << { :name=>"atlassian.xsrf.token" } if @headers["set-cookie"] =~ /atlassian\.xsrf\.token=/

	# Return passive matches
	m
end
end

