##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TorrentFlux" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-13
version "0.1"
description "Open source PHP client for web based management of torrents. Features, downloads, forum. - http://www.torrentflux.com/"

# Google results as at 2011-05-13 #
# 30 for "TorrentFlux Login" intitle:TorrentFlux +Username +Password

# ShodanHQ results as at 2011-05-13 #
# 290 for TorrentFlux

# Dorks #
dorks [
'"TorrentFlux Login" intitle:TorrentFlux "Username" "Password"'
]



# Matches #
matches [

# Login Page # font title
{ :text=>'<font class="title">TorrentFlux Login</font>' },

# Login Page # Password field
{ :text=>'<td><input type="password" name="iamhim" value="" size="15" style="font-family:verdana,helvetica,sans-serif; font-size:9px; color:#000" /></td>' },

]

# Passive #
def passive
	m=[]

	# TorrentFlux cookie
	m << { :name=>"TorrentFlux cookie" } if @headers["set-cookie"] =~ /^TorrentFlux=[a-z\d]+; path=\//

	# Return passive matches
	m
end

end


