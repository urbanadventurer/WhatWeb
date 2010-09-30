##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :certainty
# Version 0.3
# uses :modules

Plugin.define "PHPNuke" do
author "Andrew Horton"
version "0.3"

description "PHP-Nuke is a free CMS. Homepage: phpnuke.org. The plugin passively recognises modules. An obvious improvement would be to aggresively discover modules and discover the phpnuke version"

examples %w|http://www.patientjourney.org.nz http://www.schoolhistory.co.nz http://www.sil3nt.zl1my.co.nz http://www.tagairsoft.co.nz http://www.freeze.co.nz/community/index.php http://www.ig42.com http://www.isea.org.nz http://www.kakariki.net http://www.tweakforce.com www.vcdeasy.org www.quransunnah.com|

# www.vcdeasy.org and www.quransunnah.com are disguised 

#  ["<a href=\"modules.php?name=Your_Account\">", 19],
# "<META NAME=\"RATING\" CONTENT=\"GENERAL\">"
# <a href=\"http://phpnuke.org/files/gpl.txt\">"
# <a href="modules.php?name=Feedback">Feedback</a>
#<a href='http://www.phpnuke.org'><img src='images/powered/phpnuke.gif' title="The engine code is copyright of PHP-Nuke." border='0'></a>

#<meta name="generator" content="AutoTheme - http://spidean.mckenzies.net / PHP-Nuke - http://phpnuke.org">
#<meta name="generator" content="PHP-Nuke Copyright (c) 2006 by Francisco Burzi.
# <META NAME="GENERATOR" CONTENT="PHP-Nuke Copyright (c) 2005 by Francisco Burzi. This is free software, and you may redistribute it under the GPL (http://phpnuke.org/files/gpl.txt). PHP-Nuke comes with absolutely no warranty, for details, see the license (http://phpnuke.org/files/gpl.txt).">

#www.FreePHPNuke.org uses gate.html instead of modules.php - snfl.freephpnuke.org

matches [
{:name=>"meta generator tag with PHP-Nuke", 
:regexp=>/<meta name="generator" content="[^"]+(PHP-Nuke|http:\/\/phpnuke.org)/i},

{:certainty=>75,
:text=>"<a href=\"modules.php?name=Your_Account\">"},

# this also appears in DotNetNuke
{:certainty=>25,
:text=>"<META NAME=\"RATING\" CONTENT=\"GENERAL\">"},

{:certainty=>75,
:text=>"<a href=\"http://phpnuke.org/files/gpl.txt\">"},

{:name=>"Feedback link",
:certainty=>75,
:text=>"<a href=\"modules.php?name=Feedback\">Feedback</a>"},

{:name=>"modules.php?name links",
:certainty=>25,
:regexp=>/<a href="[^"]*modules.php\?name=[a-zA-Z0-9_]+[^"]*">/},

{:name=>"engine code is copyright of PHP-Nuke",
:text=>"<a href='http://www.phpnuke.org'><img src='images/powered/phpnuke.gif' title=\"The engine code is copyright of PHP-Nuke.\" border='0'></a>"}
]

def passive
	m=[]
	if @body =~ /<a href="[^"]*modules.php\?name=[a-zA-Z0-9_]+[^"]*">/
#		pp @body.scan(/<a href="modules.php\?name=([a-zA-Z0-9_]+)">[a-zA-Z0-9_]+<\/a>/)
		modules = @body.scan(/<a href="[^"]*modules.php\?name=([a-zA-Z0-9_]+)[^"]*">/).flatten.compact.sort.uniq.join(",")
		m << {:certainty=>75,:modules=>modules}
	end
	m
end

end

