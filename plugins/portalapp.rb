##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PortalApp" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.1"
description "PortalApp is a fast, flexible, configurable CMS and portal system that can be used to create everything from Blogs to Web sites."
website "http://www.portalapp.com/"

# 155 results for "powered by PortalApp" -exploit @ 2010-07-10

# Dorks #
dorks [
'"powered by PortalApp" -exploit'
]



# Matches #
matches [

# Powered by text
{:regexp=>/<img src='[\/]*images\/palogo_gr_17.gif' height=23 alt='powered by PortalApp' align=[\'|\"]*[center|middle]+[\'|\"]*><\/A>/ },

{:regexp=>/<meta name=[\'|\"]*generator[\'|\"]* content=[\'|\"]*aspapp.com[\'|\"]*[\ \/]*>/ },
]

end

