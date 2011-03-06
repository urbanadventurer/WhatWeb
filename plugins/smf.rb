##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-03-05 #
# Updated version detection
##
# Version 0.2
# removed :certainty=>100
##
Plugin.define "SMF" do
author "Andrew Horton"
version "0.3"
description "SMF (Simple Machines Forum) is an opensource forum written in PHP. Homepage: www.simplemachines.org"

# Examples #
examples %w| http://bangladeshtalks.com/ http://www.petgrowth.com/ http://warriorcatsrpg.com/ http://www.3wanime.org/forums/ http://aportesydescargas.com.ar/foro/ http://aquatropicalfish.com/forum/ http://www.club4g.com/ http://www.win7vista.com|

# Matches #
matches [

# Copyright Link
{:name=>"copyright link", :text=>'<a href="http://www.simplemachines.org/about/copyright.php" title="Free Forum Software" target="_blank"'},

# Default JavaScript
{:name=>"javascript", :text=>'document.getElementById("upshrink").src = smf_images_url + '},

# smflogo
{:name=>"smflogo gif", :regexp=>/<img class="floatright" id="smflogo" src="[^"]*\/images\/smflogo.gif" alt="Simple Machines Forum" \/>/},

# Version Detection # Powered by text
{ :version=>/<a href="http:\/\/www.simplemachines.org\/" title="Simple Machines Forum" target="_blank"( class="new_win")?>Powered by SMF ([^<]+)/, :offset=>1 },

]

end

