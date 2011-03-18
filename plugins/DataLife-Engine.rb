##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DataLife-Engine" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "DataLife Engine CMS - Homepage: http://dle-news.ru"

# Google results at 2011-03-18 #
# 374 for "powered by DataLife Engine"

# Examples #
examples %w|
pc.m7shsh.com
dle-en.com
www.bahdla.com
rapidshara.org
kurdseed.freevar.com
cs.youjed.com
www.netkozmos.com
bacsivitinh.com
www.ulvichess.az/dle/ulvichess/index.php
chohagia.com
fcnews.site.ge
dl7all.net
softs4u.eu
www.downloadx.in
chernobili.com
rusinet.com
hotgallery.org
www.era.ge
digggu.co.cc
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="DataLife Engine (http://dle-news.ru)" />' },
{ :text=>'<meta name="generator" content="DataLife Engine" />' },

# Meta Generator # Nulled
{ :text=>'<meta name="generator" content="DataLife Engine Nulled by M.I.D-Team (http://www.mid-team.ws)" />', :string=>"Nulled by M.I.D-Team" },

# JavaScript
{ :regexp=>/<script language="javascript" type="text\/javascript">[\s]+<!--[\s]+var dle_root       = '[^']+';[\s]+var dle_admin      = '[^']*';[\s]+var dle_login_hash = '[^']*';[\s]+(var dle_group      = [\d]+;[\s]+)?var dle_skin       = '[^']*';[\s]+var dle_wysiwyg    = '[^']*';[\s]+var quick_wysiwyg  = '[^']*';[\s]+/ },

]

end


