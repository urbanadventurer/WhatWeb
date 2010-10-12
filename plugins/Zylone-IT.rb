##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zylone-IT" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "homepage: http://www.zylone.com/"

# 50 results for "powered by Zylone IT" -Vulnerability @ 2010-10-12
examples %w|
agape-gean.com.sg
demo3.zylone.com/genetic-cms/
www.aeimage.com.sg
www.avitar.com.sg
www.digiesl.com
www.digisound.com.sg
www.hof.com.my
www.jessicapatterson.com/index.php
www.millionblogshops.com/index_.php
www.orange-lantern.com
www.tae.com.sg
|

matches [

# Powered by text
{ :regexp=>/Powered by[:]? <a href="http:\/\/www.zylone.com[\/]*[^>]+>Zylone IT/ },

]

end

