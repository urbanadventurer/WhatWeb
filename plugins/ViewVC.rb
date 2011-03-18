##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ViewVC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "ViewVC (formerly known as ViewCVS) is a browser interface for CVS and Subversion version control repositories. It generates templatized HTML to present navigable directory, revision, and change log listings. It can display specific versions of files as well as diffs between those versions. - Homepage: http://viewvc.tigris.org/"

# Google results as at 2011-03-18 #
# 288 for "Powered by viewvc"

# Examples #
examples %w|
webwork.maa.org/viewvc
gcc.gnu.org/viewcvs
src.chromium.org/viewvc/
sources.gentoo.org
cvs.fedoraproject.org/viewvc/
cvs.rpmfusion.org/viewvc/
repoze.org/viewcvs/
www.x86-64.org/viewvc/
svn.cs.brynmawr.edu/viewvc/
www.ncbi.nlm.nih.gov/viewvc/
anonsvn.mit.edu/viewvc/
anonsvn.internet2.edu/cgi-bin/viewvc.cgi
svn.middleware.georgetown.edu/view/
www.gelato.unsw.edu.au/cgi-bin/viewvc.cgi
cvs.gnupg.org/cgi-bin/viewcvs.cgi
www.dlib.indiana.edu/cgi-bin/viewvc/viewvc.cgi
version.1ec5.org/viewvc.cgi
www.farmanager.com/viewvc/
rdos.net/vc/viewvc.cgi
svn.ehas.org/viewvc.cgi
www.tetrasys.homelinux.org/cgi-bin/viewvc.cgi
wikitex.org/viewvc/
debianlive.org/bliss/viewvc/
|

# Matches #
matches [

# Title
{ :text=>'<title>ViewVC Repository Listing</title>' },

# HTML Comment
{ :text=>'<!-- ViewVC :: http://www.viewvc.org/ -->' },

# Version Detection # 
{ :version=>/<td>Powered by <a href="http:\/\/viewvc.tigris.org\/">ViewVC ([^<]+)<\/a><\/td>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="ViewVC ([^"]+)" \/>/ },

]

end


