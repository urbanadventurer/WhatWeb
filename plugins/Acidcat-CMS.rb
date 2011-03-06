##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Acidcat-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "Acidcat ASP CMS - Homepage: http://www.acidcat.com/"

# Google results as at 2011-03-06 #
# 167 for "Powered by Acidcat CMS"

# Examples #
examples %w|
www.acidcat.com/demo1_en/
www.acidcat.com/demo1_en/admin/
www.acidcat.com/demo1_fr/
www.acidcat.com/demo1_fr/admin/
www.acidcat.com/demo1_de/
www.acidcat.com/demo1_de/admin/
www.afaceribuftea.ro
www.debiechten.nl
www.klommesten.no
www.tcob.no
ptmbodrum.com
www.avsantjosep.org
www.tourlemans.com
chrkrist.dk
www.amicidellaferroviavalmorea.it
www.dub.cat
www.adkf.dk
www.hundestedroklub.dk
www.bonandrini.it/acidcat/
famfisker.dk
www.psicologiaorru.com.br
golfavisenopen.dk
www.whepping.nl/hzvvsupercoach/acidcat/
www.stou.ac.th/schools/sec/main/
www.scuolasaba.it/acidcat/
www.vandersar.info
|

# Matches #
matches [

# HTML Comment
{ :text=>'<!-- Start Acidcat CMS footer information. Note: this code is not to be edited or removed in the free version. -->' },

# Default footer table HTML
{ :text=>'<tr><td colspan="2" valign="top" class="ac_menuleftbg" ><table width="100%" cellspacing="0" border="0"><tr>' },
{ :text=>'<tr><td colspan="2" valign="top" class="ac_menuleftbg" ><table cellspacing="0" border="0"><tr>' },
{ :text=>'<td class="ac_footer_menu">&nbsp;<br /><br /></td></tr></table></td>' },
{ :text=>'<td class="ac_footer_menu">&nbsp;<br /></td></tr></table></td>' },

# Admin Page # Table CSS class
{ :certainty=>75, :text=>'<table cellspacing="0" class="ac_admin_main">' },

# Admin Page # Default StyleSheet HTML
{ :text=>'<link href="admin/css/admin_import.css" rel="stylesheet" type="text/css" />' },

# Error Page
{ :text=>"<br><center><table border=1 class=errorTable><tr><td class='login_view'><img src=images/acidcat_logo.gif><td colspan=1 class='login_view'><b>Acidcat CMS Error" },

# Version Detection # Powered by footer
{ :version=>/<a href="http:\/\/www.acidcat.com">Powered by Acidcat CMS v ([\d\.a-z]+)<\/a>/ },

]

end


