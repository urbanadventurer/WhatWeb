##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TFTgallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "TFTgallery is a PHP based web image gallery which doesn't need a database. It uses the directory structure for data storage. The main features are: an on-the-fly thumbnail creation, PDF and ZIP creation, image calendars, EXIF support."
website "http://www.tftgallery.org/"

# Google results as at 2011-02-27 #
# 39 for intitle:"TFTgallery administration"

# Dorks #
dorks [
'intitle:"TFTgallery administration"'
]



# Matches #
matches [

# Default select tag
{ :text=>'Select an album: <select name="album" onchange="javascript:document.tftnavi.submit();"><option></option>' },

# Admin Page # Default Title
{ :text=>"<title>TFTgallery administration</title><link rel='stylesheet' type='text/css' href" },

# Admin Page # Back to gallery link
{ :text=>'<div class="login_text"><br /><a href="../index.php">back to the gallery</a></div>' },

# Default Logo
{ :regexp=>/<td class='footer_right'><a href='http:\/\/www.tftgallery.org\/' target='_blank'><img src="[^"]*images\/TFTgallery.png" alt="TFTgallery" border="0" \/><\/a><\/td>/ },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="TFTgallery ([\d\.]{1,5}) http:\/\/www.tftgallery.org\/" \/>/ },

]

end


