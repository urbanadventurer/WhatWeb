##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and ghdb matches
##
Plugin.define "CMScontrol" do
author "Brendan Coles <bcoles at gmail dot com>" # 2010-06-15
version "0.2"
description "CMScontrol"
website "http://www.cmscontrol.com/"

# Google results as at 2010-06-15 #
# 79 for +CMScontrol -"SQL Injection" -exploit +inurl:"index.php?id_menu="

# Dorks #
dorks [
'"CMScontrol" -"SQL Injection" -exploit inurl:"index.php?id_menu="'
]



matches [

# 79 results for +CMScontrol -"SQL Injection" -exploit +inurl:"index.php?id_menu=" @ 2010-06-15
{ :ghdb=>'+CMScontrol inurl:"index.php?id_menu="', :certainty=>25 },

# Default meta generator
{ :regexp=>/<META name=[\"\']*generator[\"\']* content=[\"\']*CMScontrol eContent[\"\']*>/i
},

# Default meta formatter
{ :regexp=>/<META name=[\"\']*formatter[\"\']* content=[\"\']*CMScontrol eContent[\"\']*>/i },

# Default meta abstract
{ :regexp=>/<META name=[\"\']*abstract[\"\']* content=[\"\']*CMScontrol[\"\']*>/i },

# Default javascript in old versions
{ :text=>'document.write("<ME"+"TA ht"+"tp-eq"+"uiv=\"REF"+"RESH\" con"+"tent=\"1.00; u"+"rl="+"index"+"."+"ph"+"p\">");' },

# Default meta generator # 3.x
{ :regexp=>/<META NAME=[\"\']*generator[\"\']* CONTENT=[\"\']*CMScontrol rel 3.x[\"\']*>/i, :version=>'3.x' },

]

end

# It should be possible to guess the version depending on the copyright dates:
# <META name="copyright" content="Copyright 2000-2006 CMScontrol-GervaWeb">
# <META NAME='copyright' CONTENT='Copyright © Gerva Srl'>

