##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VLC-Web-Interface" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-20
version "0.1"
description "Web interface for VideoLAN media player"
website "http://www.videolan.org/"

# Google results as at 2011-06-20 #
# 5 for intitle:"VLC media player - Web Interface" "VLM interface"

# Dorks #
dorks [
'intitle:"VLC media player - Web Interface" "VLM interface"'
]



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<title>VLC media player - Web Interface</title>' },
{ :certainty=>75, :text=>'<title>VLC media player - Web Interface - Mosaic Wizard</title>' },
{ :certainty=>75, :text=>'<title>VLC media player - Web Interface with Flash Viewer</title>' },
{ :certainty=>75, :text=>'<title>VLC media player - Web Interface - VLM</title>' },

# HTML Comment
{ :text=>'<!-- do we need to browse in order to setup a mosaic ? for the background image maybe ... -->' },

# Forms
{ :text=>'<input type="checkbox" id="vlm_schedule_repeat" onchange="toggle_schedule_repeat();update_vlm_add_schedule();" />' },
{ :text=>'<input type="text" name="sout_mrl" id="sout_mrl" size="60" onkeypress="if( event.keyCode == 13 ) vlm_output_change();"/>' },

]

end

