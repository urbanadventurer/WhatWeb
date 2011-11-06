##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BigDump" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "BigDump: Staggered MySQL Dump Importer  - Homepage: http://www.ozerov.de/bigdump.php"

# 230 for intitle:"BigDump ver" +Filename "BigDump: Staggered MySQL Dump Importer"
# 210 for inurl:"bigdump.php" intitle:"BigDump ver" +Filename "BigDump: Staggered MySQL Dump Importer"

# Dorks #
dorks [
'inurl:"bigdump.php" intitle:"BigDump ver" "Filename" "BigDump: Staggered MySQL Dump Importer"'
]

# Examples #
examples %w|
oruwebsite.org/dump/bigdump.php
www.twinkletwinklelittlestars.com/bigdump.php
equipmentsfarm.com/bigdump.php
www.lebnn.com/bigdump.php
mramail.org/upload/bigdump.php
jpinfomeshon.jp/bigdump.php
minilaptops.iim.bz/bigdump.php
mysydneyhotel.com/bigdump.php
microxbeta.sys1.co.uk/bigdump.php
svsting.org/xml/bigdump.php
uk.akshayjain.org/bigdump.php
luxdev.org/d/bigdump.php
www.aisforarmy.com/bigdump.php
taleemsa.gov.sa/bigdump.php
|

# Matches #
matches [

# Version Detection
{ :version=>/<h1>BigDump: Staggered MySQL Dump Importer ver\. ([^\s^<]{2,6})<\/h1>/ },
{ :version=>/<title>BigDump ver\. ([^\s^<]{2,6})<\/title>/ },

]

end


