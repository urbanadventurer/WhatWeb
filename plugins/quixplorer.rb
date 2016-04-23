##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QuiXplorer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "QuiXplorer is a multi-user, web-based file-manager. It allows you to manage and/or share files over the internet, or an intranet."
website "http://quixplorer.sourceforge.net/"

# Google results as at 2011-05-16 #
# 77 for "QuiXplorer" +Username +Password +"the QuiX project"

# Dorks #
dorks [
'"QuiXplorer" "Username" "Password" "the QuiX project"'
]



# Matches #
matches [

# Version Detection # Default Title
{ :version=>/<title>QuiXplorer ([^\s]+) - the QuiX project<\/title>/ },

# Version Detection # Footer link
{ :version=>/<A class="title" href="http:\/\/quixplorer\.sourceforge\.net" target="_blank">QuiXplorer ([^<]+)<\/A> - <A href="http:\/\/quix\.tk" target="_blank">the QuiX project<\/A><\/SMALL>/ },

# Footer link
{ :text=>'<A class="title" href="http://quixplorer.sourceforge.net" target="_blank">QuiXplorer</A> - <A href="http://quix.tk" target="_blank">the QuiX project</A></SMALL>' },

]

end


