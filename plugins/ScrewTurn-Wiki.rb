##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ScrewTurn-Wiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "ScrewTurn Wiki allows you to create, manage and share wikis."
website "http://www.screwturn.eu/"

# 73 for "Powered by ScrewTurn Wiki version "

# Dorks #
dorks [
'"Powered by ScrewTurn Wiki version "'
]



# Matches #
matches [

# Version detection # Powered by footer
{ :version=>/Powered by <a class="externallink" href="http:\/\/www\.screwturn\.eu" title="ScrewTurn Wiki" target="_blank">ScrewTurn Wiki<\/a> version ([\d\.]+)/ },

]

end


