##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DeluxeBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "DeluxeBB is a powerful open source bulletin board, which helps you create your own web communities in less than 10 minutes. The board is written completely in PHP and uses a MySQL database to store its content."
website "http://www.deluxebb.com/"

# Google results as at 2011-02-27 #
# 69 for "DeluxeBB 1.3 is copyrighted to the DeluxeBB team '05-08"

# Dorks #
dorks [
'"DeluxeBB 1.3 is copyrighted to the DeluxeBB team \'05-08"'
]



# Matches #
matches [

# Default HTML Comment
{ :regexp=>/<!-- \|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|[\r\n\s]+\| This forum is coded by and          \|[\r\n\s]+\| copyrighted to Frank Nissel         \|/ },

# Meta Description
{ :text=>'<meta name="description" content="powered by DeluxeBB - www.deluxebb.com" />' },

# Version Detection # Copyright link text
{ :version=>/<p><a href="http:\/\/www.deluxebb.com" target="_blank">DeluxeBB ([\d\.]+)<\/a> is copyrighted to the DeluxeBB team '05/ },

]

end


