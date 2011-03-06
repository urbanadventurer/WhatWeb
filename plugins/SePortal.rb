##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SePortal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "SePortal - The Weblog System - Homepage: http://www.seportal.org/"

# Google results as at 2011-03-03 #
# 89 for "Powered by SePortal"

# Examples #
examples %w|
www.seportal.org
demo.seportal.org
emlak43.net/tavsanlihaber/
188.193.251.8:82
expatsportal.com
www.cpm8241.com
dagardi.biz
sc.mybestbuy.net
www.belkoyu.com
belkoyu.de
bereni.zzl.org
www.gencpartiankara.com
pirreklam.com/install.php
www.yaylabelkoyu.com
www.zifanaaytas.com
emlak43.net
www.tumsagper.org
tenide.com
kwadrotatus.ifastnet.com/seportal/
home.northmarden.com
|

# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/<p align="center">[\r\n]*  Powered by <b>SePortal<\/b> ([\d\.]{1,5})[\r\n]*  <br \/>[\r\n]*  Copyright &copy; 20[\d]{2}-20[\d]{2} <a href="http:\/\/www.seportal.org" target="_blank">SePortal.org<\/a>[\r\n]*<\/p>/ },

# Install Page # Default Title
{ :text=>'  <title>SePortal Installer</title>' },

# favicon.ico
{ :url=>"favicon.ico", :md5=>"9749740151cf551f80983ccebc6189f4" },

]

end


