##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AlumniServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Open Source Alumni software (PHP) for universities, schools and other organizations. Features include profile page, photo upload, messages, forum, job market. Admin pages include user management, content management, newsletter, website configuration."
website "http://sourceforge.net/projects/alumniserver/"

# Google results as at 2011-03-15 #
# 9 for "AlumniServer project" inurl:AlumniServerProject.php
# 5 for "This Alumni website runs with open source software from the AlumniServer project."

# Dorks #
dorks [
'"AlumniServer project" inurl:AlumniServerProject.php',
'"This Alumni website runs with open source software from the AlumniServer project."'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'inurl:AlumniServerProject.php "AlumniServer project"' },

# AlumniServer project footer link
{ :text=>'<div style="float:right;"><a href="AlumniServerProject.php" style="color:#c6cccd;margin:2px;margin-right:10px;">AlumniServer project</a></div>' },

# NoScript HTML
{ :text=>'<div style="margin:25px 15px 20px 15px;"><noscript><div style="color:red;margin-bottom: 15px;">Your browser does not support JavaScript!</div></noscript><h2>The AlumniServer project</h2>' },

# Meta Keywords
{ :certainty=>25, :text=>'<meta name="keywords" content="Alumni,Student,Network,Community,University">' },

]

end


