##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iScripts-CyberMatch" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "iScripts CyberMatch is an open source online dating software with features like background check ,chat alerts, integrated payment system etc."
website "http://www.iscripts.com/cybermatch/"

# 26 results for "powered by iScripts CyberMatch" "A premium product from iScripts.com" @ 2010-07-11

# Dorks #
dorks [
'"powered by iScripts CyberMatch" "A premium product from iScripts.com"'
]



matches [

{ :regexp=>/    <td width="[\d]+%" align="left" class="footer">Powered by <a href="http:\/\/www.iscripts.com\/cybermatch\/" target="_blank">iScripts Cybermatch<\/a> . A premium product from <a href="http:\/\/www.iscripts.com" target="_blank">iScripts.com<\/a><\/td>/ },

]


end

