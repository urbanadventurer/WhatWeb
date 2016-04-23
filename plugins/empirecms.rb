##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Empire-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-04
version "0.1"
description "Open source CMS"
website "http://www.phome.net/"

# 371 results for "powered by EmpireCMS" @ 2010-08-04

# Dorks #
dorks [
'"powered by EmpireCMS"'
]



matches [

{ :text=>' - Powered by EmpireCMS</title>' },

]

end

