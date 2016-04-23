##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMailShare" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-18
version "0.1"
description "phpMailShare is a small php script that allows you to share emails with your friends. It uses IMAP to access your mail account and can be used with any mail server that provides IMAP access, including Gmail."
website "tekreaders.com/blog/phpmailshare/"

# Google results as at 2012-02-18 #
# 1 for "Powered by phpMailShare"



# Matches #
matches [

# Powered by link # Version Detection
{ :version=>/<div align="center">Powered by <a href="http:\/\/tekreaders\.com\/blog\/phpmailshare\/" target="_blank">phpMailShare<\/a> ([^<]+[\d\.\sa-z])<\/div>/ },

# inbox link
{ :text=>'<a href="index.php?action=viewbox&amp;box=0">' },

]

end

