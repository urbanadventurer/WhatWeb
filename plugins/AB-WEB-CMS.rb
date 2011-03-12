##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AB-WEB-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "AB WEB CMS [French] - Homepage: http://www.aeline-informatique.com/"

# Google results as at 2011-03-13 #
# 73 for inurl:ab_fct.php?fct=

# Examples #
examples %w|
www.sud-paradise-immo.com/en/ab_fct.php
www.texiergestion.com/en/ab_fct.php
www.lorraine-cyclisme.com/fr/oldfr/ab_fct.php
lehetre-immobilier.com/fr/ab_fct.php
www.agence-provence.com/fr/ab_fct.php
www.immopassion.fr/fr/ab_fct.php
www.bijouterie-stauffer.com/fr/ab_fct.php
janpolontheweb.free.fr/fr/ab_fct.php
www.providenz.com/fr/ab_fct.php
www.deltalabo.fr/fr/ab_fct.php
www.perrotfleurs.com/fr/ab_fct.php
www.bouko-immobilier.com/fr/ab_fct.php
www.kotorpharma.com/fr/ab_fct.php
www.achat-lunettes.com/fr/ab_fct.php
www.liguelorrainesportsdecontact.com/fr/ab_fct.php
www.resideva.com/fr/ab_fct.php
www.veto54.com/fr/ab_fct.php
www.lorrainemuaythai.com/fr/ab_fct.php
www.lorraine-handball.com/fr/ab_fct.php
www.cadeaux-coccinelle.com/fr/ab_fct.php
luneville-cadeaux.com/fr/ab_fct.php
www.dentam-turbinedentex.com/fr/ab_fct.php
www.rpmfermetures.com/fr/ab_fct.php
www.evolution-mountyhall.com/fr/ab_fct.php
www.rastelagay.com/fr/ab_fct.php
www.aquabio-france.com/fr/ab_fct.php
www.hbcnancysluc.com/fr/ab_fct.php
|

# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>"inurl:ab_fct.php?fct=" },

# Maximize Link
{ :text=>'<a href="#" onclick="maximize();" class="hdp_z01_z03_l" onmouseover="ShowIB(' },

# Imprimer Link
{ :text=>'<div style="text-align: center;"><br /><br /><a href="#" onclick="imprfct();" class="main_link">[Imprimer]</a></div>' },

# Version Detection # Runs with footer
{ :version=>/&nbsp;<a href="http:\/\/www.(ab-psi.com|aeline-informatique.com)" class="bdp_z01_z02_l">[^<]+ AB WEB v. ([\d\.]+)<\/a>/, :offset=>1 },

]

end


