##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-19 #
# Updated version detection
##
Plugin.define "XchangeBoard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.2"
description "Old forum - homepage: http://www.xchangeboard.de"

# Google results as at 2010-08-21 #
# 30 for "powered by XchangeBoard"

# Examples #
examples %w|
www.dr-met.de/uni/forum/index.php
forum.cresta-run.com
www.forum.gpb-edu.org/Xchange/index.php
ricqu.com/board/newPost.php
forum.cresta-run.com/listBoardThreads.php
www.kleinjung.de/techdata/board/listBoardThreads.php
www.bushido-muelheim.de/XchangeV170/
www.kleinjung.org/techdata/board/
www.wow-rda.de/forum/
kleinjung.com/techdata/board/
forum.pfarre-nfh.at
www.arm-des-gruenen-drachen.de/xboard/
vs184251.vserver.de/ogameforen/uni27/
www.mr2-club-europa.de/Clubinside/XchangeV170/
|

# Matches #
matches [

# Default CSS
{ :text=>'h1,h2,h3,h4,p,ul,ol,li,div,td,th,address,blockquote,nobr,b,i {' },

# Version Detection # Powered by footer text
{ :version=>/	<div align="center"><small>Powered by <a href="http:\/\/www.xchangeboard.de">XchangeBoard<\/a> ver ([\d\.a-z]+) - / },

]

end


