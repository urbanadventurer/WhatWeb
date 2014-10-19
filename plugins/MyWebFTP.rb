##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MyWebFTP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-20
version "0.1"
description "MyWebFTP web FTP client. MyWebFTP is designed for a professional web developer to do all your daily online file management tasks from one place. Install MyWebFTP on one of your websites, and it will allow you to quickly and efficiently manage files of all your websites via FTP."
website "http://mywebftp.com/"

# 6 for intitle:mywebftp "Please enter your password" -intitle

# Dorks #
dorks [
'intitle:mywebftp "Please enter your password" -intitle'
]



# Matches #
matches [

# Title
{ :certainty=>75, :text=>'<TITLE>MyWebFTP</TITLE>' },

# Form
{ :text=>'<FORM METHOD=post NAME="mwForm" ENCTYPE="multipart/form-data" ACTION="' },

# Version Detection
{ :version=>/^<P><B>MyWebFTP (Hoster|Free)<\/B> Version ([\d\.]+)/, :offset=>1 },

# Year Detection
{ :string=>/<BR>Copyright &copy 2000-(20[\d]{2}) <A HREF="http:\/\/www\.mywebftp\.com\/">MyWebFTP<\/A>/ },

# CSS
{ :text=>'<LINK REL="stylesheet" TYPE="text/css" HREF=\'mwftp/common/mwftp.css\'>' },

# JavaScript
{ :text=>'<SCRIPT LANGUAGE=JAVASCRIPT SRC=\'mwftp/common/mwftp.js\'></SCRIPT>' },

]

end


