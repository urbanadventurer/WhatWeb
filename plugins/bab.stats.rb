##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BAB_Stats" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-16
version "0.1"
description "BAB.Stats is a statistics system for the Delta Force series of games by Novalogic."
website "http://www.babstats.com/progress.php"

# Google results as at 2011-03-16 #
# 137 for intitle:"Powered by BAB.Stats"
# 12 for "BAB.Stats is a statistics system for the Delta Force series of games by Novalogic" inurl:"index.php?action=about"

# Dorks #
dorks [
'intitle:"Powered by BAB.Stats"',
'"BAB.Stats is a statistics system for the Delta Force series of games by Novalogic" inurl:"index.php?action=about"'
]



# Matches #
matches [

# Meta Author
{ :text=>'<meta NAME="Author" CONTENT="Bab.Stats Team">' },

# Title
{ :certainty=>25, :regexp=>/<title>[^:]+ :: [^:]+ :: Powered by BAB.stats<\/title>/ },

# Version Detection
{ :version=>/Powered by BAB.Stats :: <a href="index.php\?action=about&bms=" onmouseover="doTooltip\(event, 'About BaB.Stats'\)" onmouseout="hideTip\(\)">BabStats v([\d\.]+)<\/a>/ },

# Version Detection
{ :version=>/Powered by <a href="index.php\?action=about&bms=">BAB.stats<\/a> version ([\d\.]+)/ },

# Chronos # Meta Author
{ :text=>'<meta NAME="Author" CONTENT="Tomas Stucinskas a.k.a Baboon">', :string=>"Chronos" },

# Chronos # Title
{ :text=>' - Powered by BAB.stats Chronos</title>', :string=>"Chronos" },

# Chronos # HTML Comment
{ :text=>'<!-- AUTHOR : Tomas Stucinskas a.k.a Baboon -->', :string=>"Chronos" },

# Chronos # Version Detection # Powered by link
{ :version=>/Powered by Bab.stats ::[\r\n\s]*<a[^>]+href="(http:\/\/www.babstats.com\/|\/Neos_Chronos\/index.php\?action=about)">Neos.Chronos<\/a> ::[\s\r\n]*Version ([^\(]+) \(Standalone\)/, :offset=>1, :string=>"Chronos" },

]

end


