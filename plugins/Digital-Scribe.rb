##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Digital-Scribe" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-31
version "0.1"
description "The Digital Scribe is a free, intuitive system designed to help teachers put student work and homework assignments online. Requires: PHP & MySQL."
website "http://www.digital-scribe.org/"

# Google results as at 2011-07-31 #
# 7 for +copyright "Digital Scribe * All Rights Reserved"

# Dorks #
dorks [
'"copyright" "Digital Scribe * All Rights Reserved"'
]



# Matches #
matches [

# Forgot Password link
{ :text=>'<BR><A HREF=forgot.php?Submit2=1&email=>Forgot your password</A>?' },

# Logo HTML
{ :text=>'<IMG SRC=/DigitalScribe/images/logosmall.gif width=158 height=63 alt="Digital Scribe Logo" border=0></a>' },

# Version Detection # Powered by link
{ :version=>/<BR><SPAN CLASS=legal>Copyright 2005-20[\d]{2} . <A HREF=http:\/\/www\.digital-scribe\.org>Digital Scribe v\.([^\s^<]+)<\/a> - All Rights Reserved<\/span>/ },

]

end

