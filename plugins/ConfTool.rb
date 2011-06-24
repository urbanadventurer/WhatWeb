##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ConfTool" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-24
version "0.1"
description "ConfTool is a Web-based event management system that was developed to support the organization of conferences, workshops, congresses and seminars. - Hompage: http://www.conftool.net/"

# Google results as at 2011-06-24 #
# 72 for "ConfTool Conference Administration" "User name or e-mail"

# Dorks #
dorks [
'"ConfTool Conference Administration" "User name or e-mail"'
]

# Examples #
examples %w|
www.conftool.net/demo/standard/
www.conftool.net/demo/pro/
conftool.iai.uni-bonn.de/websoft09/
correlation-net.org/conftoolHiv/
www.eurohrn.eu/conftool/
www.slactions.org/2011/conftool/
www.exmaralda.org/gscl/
paams.usal.es/conftoolIWPAAMS10/
bisite1.fis.usal.es/bachis2007/conftool/
fca2010.univ-lyon1.fr/conftool/index.php
https://www.stlo.unicaen.fr/icisp/ct/htdocs/
https://liris.cnrs.fr/dgci2008/conftool/
195.37.26.249/conftool/
db.csail.mit.edu/nedbday09/htdocs/index.php
crin.eng.uts.edu.au/ib2com-conftool/
elinoam.com/acorn-redecom/htdocs/index.php
www.gavab.es/conferences/anacap09/
www.symme.univ-savoie.fr/cat2009/htdocs/index.php
dipersec.king.ac.uk/conftool/
apps.fz-juelich.de/parco2007-registration/
jth2008.ehu.es/conftool/htdocs/index.php
misc.gis.tu-berlin.de/conf_isprs/htdocs/
spirit.bv.tu-berlin.de/igg/htdocs/conftool/htdocs/
icsh.nytud.hu
conf.fh-pinkafeld.ac.at
www.eguk.org.uk/conftool/
conftool.education.illinois.edu/gsc2011/
rg.epos-focus.org/htdocs/
141.44.30.179/conftool/
pleconf.cs.uni-paderborn.de/
conftool.gewisola2011.de
www.web.upsa.es/spdece08/conftool/
|

# Matches #
matches [

# h2 heading
{ :text=>'<h2 align=center>ConfTool Conference Administration</h2>' },

# Username input # Standard Edition
{ :string=>"Standard", :text=>'<td class="td_dlg_input" width=67% align=left><input type=text name=\'ctusername\' tabindex=2 size=35></td></tr>' },

# Version Detection # Pro Edition
{ :string=>"Pro", :version=>/<td align="right" nowrap><a href="http:\/\/www\.conftool\.net\/"><span class="[^"]+">Conference Software - <\/span><span class="[^"]+">[\s]+(VSIS )?ConfTool( Pro)? ([^<^\s]+)<\/span><\/a><BR>/, :offset=>2 },

# Version Detection # Standard Edition
{ :string=>"Standard", :version=>/<td align="right" nowrap><span class="normal8"><a href='http:\/\/www\.conftool\.net'>(Conference |Web-based |Event |Abstract )?(Management|Conference) (Software|System) - VSIS <b>ConfTool<\/b><\/a> Standard ([^<^\s]+)<\/span><BR>/, :offset=>3 },

]

end

