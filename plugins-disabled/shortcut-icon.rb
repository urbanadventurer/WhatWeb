##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Shortcut-Icon" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "This plugin retrieves the favicon path."



# Matches #
matches [

# Get shortcut icon link
{ :string=>/<link[^>]+rel[\s]*=[\s]*['|"]?(shortcut\ )?icon[^>]+href[\s]*=[\s]*[\'|\"]?([^\"^\'^>]+)/i, :offset=>1 },
{ :string=>/<link[^>]+href[\s]*=[\s]*['|"]?([^"^']+)[^>]+rel[\s]*=[\s]*['|"]?(shortcut\ )?icon/i },

]

end

