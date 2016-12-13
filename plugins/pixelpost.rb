##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pixelpost" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Pixelpost is an open-source, standards-compliant, multi-lingual, fully extensible photoblog application for the web. Requirements: PHP 4.3 or greater (w/ GD-lib) and MySQL 3.23.58 or greater"
website "http://www.pixelpost.org/"

# 382 results for "powered by pixelpost" @ 2010-09-18

# Dorks #
dorks [
'"powered by pixelpost"'
]



matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/www.pixelpost.org[\/]*"[\ title="Powered by Pixelpost"]*>Pixelpost<\/a>/i },
{ :text=>'Powered by <a onclick="window.open(this.href); return false;" href="http://pixelpost.org/" title="Pixelpost">Pixelpost</a>' },

]

end

