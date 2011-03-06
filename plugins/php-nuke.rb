##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-03-06 # Brendan Coles <bcoles@gmail.com>
# Updated module detection
##
# Version 0.3
# uses :module
##
# Version 0.2
# remove :certainty
##
Plugin.define "PHPNuke" do
author "Andrew Horton"
version "0.4"
description "PHP-Nuke is a free CMS. Homepage: phpnuke.org. The plugin passively recognises modules. An obvious improvement would be to aggresively discover modules and discover the phpnuke version"

# Google results as at 2011-03-06 #
# 497 for allinurl:"modules.php?name=Your_Account"
# 305 for "powered by phpnuke"
#  88 for allinurl:phpnuke/modules.php?name=Search

# Examples #
examples %w|http://www.patientjourney.org.nz http://www.schoolhistory.co.nz http://www.sil3nt.zl1my.co.nz http://www.tagairsoft.co.nz http://www.freeze.co.nz/community/index.php http://www.ig42.com http://www.isea.org.nz http://www.kakariki.net http://www.tweakforce.com www.vcdeasy.org www.quransunnah.com www.p90.nl/phpnuke/ dayfamily4.us/PHPNuke/ www.snafu-clan.co.uk/phpnuke/ www.carsena.com/phpnuke/ fullhousesoftware.com/phpnuke/ www.nmpfd.com/phpnuke/ www.clubafrika.com/phpnuke/ www.rollingthundergaming.com/phpnuke/ beachpool.com/phpnuke/|

# Matches #
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
:text=>"<a href='http://www.phpnuke.org'><img src='images/powered/phpnuke.gif' title=\"The engine code is copyright of PHP-Nuke.\" border='0'></a>"},

# Module Detection
{ :certainty=>75, :module=>/<a href="[^"]*modules.php\?name=([a-zA-Z0-9_]+)[^"]*">/ },

]

end

