##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Virtualmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-14 
version "0.1"
description "Virtualmin is a powerful and flexible web server control panel based on the well-known Open Source web-based systems management GUI, Webmin."
website "http://www.virtualmin.com/"

# Dorks #
dorks [
'"Forgot your Virtualmin password?"'
]


matches [

# 25 results @ 2010-06-14
{:name=>'GHDB: "Forgot your Virtualmin password?"',
:certainty=>75,
:ghdb=>'"Forgot your Virtualmin password?"'
},

# this text is the same for every language
{:name=>"virtualmin default text", 
:text=>'<center><a href=/virtualmin-password-recovery/>Forgot your Virtualmin password?</a></center>'
}

]

end

