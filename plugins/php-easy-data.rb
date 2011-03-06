##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex and version detection
##
Plugin.define "PHPEasyData" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-16
version "0.2"
description "homepage: http://www.phpeasydata.com/"

# 12 results for "powered by PHPEasyData" @ 2010-08-15
examples %w|
www.phpeasydata.com/annuaire/annuaire.php
www.marocannonce.org/admin/
www.e-profil.fr/annu/admin/
annuaire.divine-nolwenn.com
www.telparis.com/admin/
www.marocvoyage.org/admin/
www.lalgerie.net/admin/
www.ergotherapie.fr/annuaire/admin/
www.ambafrance-ma.org/cjb/fondsdoc/annuaire/admin/
|

matches [

# Admin page
{ :text=>"<div id='phpeasydata_container'  >" },
{ :text=>'  <head><title>PhpEasyData login page</title>' },

# Version detection # Powered by text
{ :version=>/<a[^>]*href="http:\/\/www.(phpeasydata.com|freewebmaster-scripts.com\/phpeasydata)[^>]*>PHPEasyData[\s]*([^<]+)<\/a>/ },
{ :version=>/n main de pages dynamiques. " target="_blank"[\s]*>PhpEasyData[\s]*([^<]+)<\/a><\/b>/ },

]

end

