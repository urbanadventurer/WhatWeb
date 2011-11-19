##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WooFramework" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-19
version "0.1"
description "WooFramework - theme framework - http://www.woothemes.com/wooframework/"

# Examples #
examples %w|
79.125.77.48
wpsites.net
imarketingbydesign.com
www.wegotserved.com
portableacgenerators.com
xiaoxiao.com.cn
www.freeiphone4s.info
newnation.sg
fishingminnesota.com
www.hotsangria.com
www.recess.net
verchaska.com
|

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="WooFramework ([\d\.]+)"/ },

]

end

