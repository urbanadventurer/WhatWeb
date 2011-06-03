##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebSVN" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "WebSVN offers a view onto your subversion repositories that's been designed to reflect the Subversion methodology. You can view the log of any file or directory and see a list of all the files changed, added or deleted in any given revision. You can also view compare two versions of a file so as to see exactly what was changed in a particular revision. Since it's written using PHP, WebSVN is very portable and easy to install. - Homepage: http://www.websvn.info/"

# ShodanHQ results as at 2011-06-04 #
# 2 for listing.php repname

# Google results as at 2011-06-04 #
# 311 for inurl:"comp.php?repname="
# 290 for "Powered by WebSVN 2.3.2 and Subversion"
# 203 for "Powered by WebSVN * and Subversion"

# Dorks #
dorks [
'inurl:"comp.php?repname="',
'"Powered by WebSVN * and Subversion"'
]

# Examples #
examples %w|
opensees.berkeley.edu/WebSVN/
www.cs.rpi.edu/websvn/
svn.ilab.ldeo.columbia.edu
thestaticvoid.com/wsvn/
loft.optics.arizona.edu/svn/
websvn.ow2.org
cnmc30.hs.ntnu.edu.tw/websvn/
www.denorastats.org/websvn/
openoffice.oss.gov.vn/websvn/
ncisvn.nci.nih.gov/WebSVN/
atlaswww.hep.anl.gov/asc/WebSVN/
svn.mikrokopter.de
svn.cherokee-project.com
svn.fryer.org.uk/websvn/
svn.7zsfx.info
apoc.sixserv.org/coderepo/
linuxfoo.de/websvn/
svn.grindstone4spam.atopa.me
studenti.scuole.bo.it/websvn/
source.cfengine.com/websvn/
www.wh0rd.biz/websvn/
websvn.dharmatech.org/websvn/
www.geniustrader.org/websvn/
websvn.freemyipod.org
svn.omega-services.org
|

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta http-equiv="generator" content="WebSVN ([^"]+)"[\s]?\/>/ },

# WebSVN RSS link
{ :text=>'<link rel="alternate" type="application/rss+xml" title="WebSVN RSS" href="rss.php?repname=' },
{ :text=>"<link rel='alternate' type='application/rss+xml' title='WebSVN RSS' href='rss.php?repname=" },

# Aggressive # templates/BlueGrey/images/favicon.ico
{ :md5=>"beb816a701a4cee3c2f586171458ceec", :url=>"templates/BlueGrey/images/favicon.ico" },

# Aggressive # templates/BlueGrey/images/websvn.png
{ :md5=>"b2bb1d54c7bab453c0e054b31b6919e4", :url=>"templates/BlueGrey/images/websvn.png" },

]

# Passive #
def passive
	m=[]

	# Powered by text
	if @body =~ /Powered by <a href="http:\/\/www\.websvn\.info\/">WebSVN<\/a> ([^\s]+) and <a href="http:\/\/subversion\.tigris\.org">Subversion<\/a> [^\s]+ &nbsp; &nbsp; &#x2713;/

		# Version Detection
		m << { :version=>@body.scan(/Powered by <a href="http:\/\/www\.websvn\.info\/">WebSVN<\/a> ([^\s]+) and <a href="http:\/\/subversion\.tigris\.org">Subversion<\/a> [^\s]+ &nbsp; &nbsp; &#x2713;/) }

		# Module Detection # Subversion
		m << { :module=>@body.scan(/Powered by <a href="http:\/\/www\.websvn\.info\/">WebSVN<\/a> [^\s]+ and <a href="http:\/\/subversion\.tigris\.org">(Subversion)<(\/)a> ([^\s]+) &nbsp; &nbsp; &#x2713;/).to_s }

	end

	# Redirect Location
	if @status.to_s =~ /^302$/ and @meta["location"] =~ /^listing\.php\?repname=[^\s]+$/
		m << { :string=>@meta["location"].scan(/^listing\.php\?repname=([^\s]+)$/) }
	end

	# Return passive matches
	m
end

end

