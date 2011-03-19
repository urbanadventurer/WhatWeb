##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DokuWiki" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-20
version "0.1"
description "DokuWiki is a standards compliant, simple to use Wiki, mainly aimed at creating documentation of any kind. - Homepage: http://dokuwiki.org/"

# Google results as at 2011-03-20 #
# 176 for "powered by DokuWiki" inurl:doku.php filetype:php

# Examples #
examples %w|
www.dokuwiki.org/dokuwiki/
wmi.math.u-szeged.hu/xaos/doku.php
www.oalodgemaster.org/support/docs/doku.php
www.cdburnerxp.se/help/doku.php
home.agh.edu.pl/~wta/doku.php
is.csie.ncyu.edu.tw/iswiki/doku.php
taiwan.caltech.edu/doku.php
www.egr.msu.edu/~zhaojia1/doku.php
people.eecs.ku.edu/~eecs138/webprogramming/doku.php
primates.ximian.com/~glesage/wiki/doku.php
www.isfahanlug.org/doku.php
lodgemaster.oa-bsa.org/support/docs/doku.php
www.radioswap.net/wiki/doku.php
ihuru.fe.up.pt/palestrasDEI/doku.php
www.the-wolfpack.eu/dokuwiki/doku.php
n0rad.fr/doku.php
www.cdasoftware.com.au/docsonline/doku.php
evoplant.uni-hohenheim.de/doku.php
www.ustm.ac.mz/wiki/doku.php
www.pirateparty.be/elections/doku.php
|

# Matches #
matches [

# GHDB
{ :ghdb=>'"powered by DokuWiki" inurl:doku.php filetype:php' },

# div class
{ :regexp=>/<div class="dokuwiki"[\s]?>/ },

# Meta Generator
{ :text=>'<meta name="generator" content="DokuWiki" />' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="DokuWiki Release ([^"]+)" \/>/ },

]

end


