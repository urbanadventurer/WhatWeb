##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Gitweb" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-24
version "0.1"
description "Gitweb is a Git web interface, the one working on http://www.kernel.org/git/. It is written in Perl, and can be used as a CGI script, or as a mod_perl legacy script (run by ModPerl::Registry handler). It allows browsing a git repository (or a set of git repositories) using a web browser."
website "http://git.or.cz/gitwiki/Gitweb"

# Google results as at 2011-01-24 #
# 228 results for "Project" "Description" "Owner" "Last Change" "Search" "summary" "shortlog" "log" "tree" "TXT" "OPML" intitle:git

# Dorks #
dorks [
'"Project" "Description" "Owner" "Last Change" "Search" "summary" "shortlog" "log" "tree" "TXT" "OPML" intitle:git'
]



# Matches #
matches [

	# Version Detection # Meta Generator
	{ :version=>/<meta name="generator" content="gitweb\/([\d\.a-z]{1,25}) git\/[\d\.a-z]{1,25}"\/>/ },

	# Version Detection # HTML Comment
	{ :version=>/<!\-\- git web interface version ([\d\.a-z]{1,25}), \(C\) 2005-2006, Kay Sievers <kay.sievers@vrfy.org>, Christian Gierke \-\->/ },

	# Git Version Detection # HTML Comment
	{ :module=>/<!\-\- git core binaries version ([\d\.a-z]{1,25}) \-\->/ },

	# Git Version Detection # Meta Generator
	{ :module=>/<meta name="generator" content="gitweb\/[\d\.a-z]{1,25} git\/([\d\.a-z]{1,25})"\/>/ },

]

end

