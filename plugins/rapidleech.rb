##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Rapidleech" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-19
version "0.1"
description "Rapid Leech is a free server transfer script for use on various popular upload/download sites such as megaupload.com, Rapidshare.com and more than 45 others. The famous Rapidleech script transfers files from Rapidshare, Megaupload, Depositfiles.com, Easy-share.com, etc, via your fast servers connection speed and dumps the file on your server. You may then download these files from your server anytime later. Rapidleech script has being used by more than 5 million users worldwide and has being installed on more than 2000 servers."
website "http://code.google.com/p/rapidleech/"

# Google results as at 2010-12-30 #
# 137 for "Credits to Pramode & Checkmate & Kloon" "RapidleechHost Offical Hosting" intitle:"Rapidleech"



# Matches #
matches [

# Default credits footer
{ :regexp=>/<small[^>]+>Credits to Pramode &amp; Checkmate &amp; Kloon<\/small><br/ },

# PlugMod # Default credits footer
{ :regexp=>/<small[^>]+>Credits to Pramode &amp; Checkmate &amp; Kloon. Mod by: MsNeil &amp; Idoenk<\/small><br/, :module=>"PlugMod" },

]

end


