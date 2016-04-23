##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Comprafacil" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-19
version "0.1"
description "Web shop app [Brazilian]"
website "http://www.comprafacil.com.br/"

# Google results as at 2011-05-19 #
# 81 for inurl:"viewSection.jsf" ext:jsf

# Dorks #
dorks [
'inurl:"viewSection.jsf" ext:jsf'
]



# Matches #
matches [

# Powered by link
{ :text=>'<a id="seloPowered" href="http://www.comprafacil.com.br"><img alt="Powered by Comprafacil" src="' },

# Meta Author
{ :text=>'<meta name="author"      content="HERMES SA" />' },
{ :text=>'<meta name="author" content="HERMES SA" />' },

]

end

