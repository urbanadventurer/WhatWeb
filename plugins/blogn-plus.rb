##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex matches and version detection
##
Plugin.define "BlognPlus" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-15
version "0.2"
description "BlognPlus - homepage: http://www.blogn.org/"

# 106 results for "powered by BlognPlus" @ 2010-06-15
examples %w|
fuc.byethost2.com/blog/
www.acute-girls.com/nega/renew/
quatrefoil.net
www.kickout.org
www.eg2mix.com
www.hyperntn.net/weblog/
www.sendai-c.ed.jp/~koorisyo/blognplus/
www.okinawanet.info/oki/
www.teamhanes.com/contents/surfin/
www.q-v-p.com/kyui/
|

matches [

# Default powered by text
{ :regexp=>/Powered by[\s]*<a href="http:\/\/www.blogn.org[^>]*>BlognPlus/i },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="BlognPlus ([0-9\.]+)/ },

]

end

# It may be possible to guess the version depending on the copyright dates:
# <META name="copyright" content="Copyright 2000-2006 CMScontrol-GervaWeb">
# <META NAME='copyright' CONTENT='Copyright © Gerva Srl'>

