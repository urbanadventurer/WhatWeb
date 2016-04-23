##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Imageview" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Imageview 6 is a 4th generation image gallery script, using AJAX to deliver the best version yet."
website "http://www.blackdot.be/?inc=projects/imageview"

# Google results as at 2011-03-15 #
# 77 for inurl:imageview5
# 63 for inurl:imageview6
# 64 for intitle:"Imageview * :: By Jorge Schrauwen"
# 67 for intitle:"Imageview * :: Help::"

# Dorks #
dorks [
'inurl:imageview5',
'inurl:imageview6',
'intitle:"Imageview * :: By Jorge Schrauwen"'
]



# Matches #
matches [

# Frameset
{ :regexp=>/<td (width="160"|rowspan="2")><iframe allowtransparency="yes" frameborder="0" height="100%" width="100%" scrolling="auto" title="(frmcontent|frmlist)" name="(frmcontent|frmlist)" src="albumlist.php\?album=[^"]*"><\/iframe><\/td>/ },

# Meta Author
{ :certainty=>25, :text=>'<meta name="author" content="Jorge Schrauwen" />' },

# Frame
{ :text=>'<frame src="preload.php" name="frImageview" id="frImageview" />' },
{ :text=>'<frame src="about:blank" name="iHistoryRecorder" id="iHistoryRecorder" />' },

# Meta Description
{ :version=>/<meta name="description" content="Imageview ([\d]{1}) :: By Jorge Schrauwen \(http:\/\/www.backdot.be\)">/ },

# Link Developer
{ :text=>'<link rel="Developer" href="http://www.blackdot.be" title="Blackdot.be" />' },

# Version Detection # Help Page # Default Title
{ :version=>/<title>Imageview ([\d]{1}) :: Help:: (Administration|Installation|Miscellaneous|User|Welcome|Menu)<\/title>/ },

# Version Detection # Default Title
{ :version=>/<title>Imageview ([\d]{1}) :: (By Jorge Schrauwen|User Settings|Upload Image|Album View|Administration|RSS Feeds|Install)<\/title>/ },

]

end


