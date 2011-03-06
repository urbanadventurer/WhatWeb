##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Zimplit-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "Zimplit CMS: The easiest Open Source Content Management System for small web- and minisites - homepage: http://www.zimplit.com/"

# 187 results for "powered by Zimplit CMS" @ 2010-10-11
examples %w|
www.zimplit.com
www.zimplit.org
www.zimplit.org/templatetest/1/
www.zimplit.org/templatetest/10/
client.zimplit.com/ztemplates/templatesPreviews/1/
client.zimplit.com/ztemplates/templatesPreviews/10/
avonwaycommunitycentre.org.uk
fujiko.110mb.com
klaes.org
nils.ostumaa.ee
paulwren.com
plumberswebdesign.com
religionofislam.org
sunshineheights.pcpcontario.org
villayuste.es
zentouchbodywork.com
zimplittest.110mb.com
www.appelsmetperen.nl/old/contact.html
www.baltplast.ee
www.dame2carreaux.com
www.fortyfiveup.com
www.gasparinisales.com
www.hegllc.com/hegllc/index.html
www.katelan.idv.tw
www.leadfeather.org/concrete/themes/GreenyGrass/
www.lintall.com
www.muhumuuseum.ee/eng/
www.rdpower.it
www.rotterdamcomputer.nl/rotterdam/
www.sarah-jane.net
www.seal-project.eu
www.smakfullt.org
www.sync101.com
www.toomikes.com/zip/
|

matches [

# Default Javascript
{ :regexp=>/<[script|SCRIPT]+[\ type=text\/javascript]* src="http:\/\/zimplit.org\/editor\/[jquery.js|ZimgZoomer.js|ZZMenu.js]+"[\ type=text\/javascript]*><\/[script|SCRIPT]+>/ },
{ :regexp=>/<[script|SCRIPT]+[\ type="text\/javascript"]* src="http:\/\/client.zimplit.com\/users\/publicUser\/[jquery.js|ZimgZoomer.js|ZZMenu.js]+"[\ type="text\/javascript"]*><\/[script|SCRIPT]+>/ },

# Version detection # Default Javascript
{ :version=>/<[script|SCRIPT]+[\ type="text\/javascript"]* src="http:\/\/client.zimplit.com\/users\/publicUser_v([\d\._]+)\/[jquery.js|ZimgZoomer.js|ZZMenu.js]+"[\ type="text\/javascript"]*><\/[script|SCRIPT]+>/ },

# Powered by text
{ :text=>'<!-- YOU ARE ONLY ALLOWED TO HIDE, DELETE OR MODIFY "POWERED BY ZIMPLIT CMS" LINK, IF THE DOMAIN HAS BEEN REGISTERED WITH A COMMERCIAL LICENSE AT WWW.ZIMPLIT.ORG -->' },
{ :text=>'<a href="http://www.zimplit.org/" class="">Powered&nbsp;by Zimplit CMS</a><!-- YOU ARE ONLY ALLOWED TO HIDE, DELETE OR MODIFY "POWERED BY ZIMPLIT CMS" LINK, IF THE DOMAIN HAS BEEN REGISTERED WITH A COMMERCIAL LICENSE AT WWW.ZIMPLIT.ORG -->' },

# Unknown Template # Powered by text
{ :text=>"<!-- Please don't delete this. You can use this template for free and this is the only way that you can say thanks to me -->" },
{ :text=>'<P id=dont-delete-this><A class="" href="http://www.zimplit.org/">Powered by Zimplit CMS</A></P><!-- Thank you :) --></DIV>' },

# Greeny Grass Template # http://www.freecsstemplates.org # Powered by text
{ :text=>'<a href="http://zimplit.org" class="">powered&nbsp;by&nbsp;zimplit&nbsp;cms</a>' },

# Business Design 2007 Temaplte # http://www.sitecreative.net/ # Powered by text
{ :text=>'<A class="" href="http://www.zimplit.org/">Powered by Zimplit CMS</A>' },

# DoDarSoft Template # http://www.DoDarSoft.com/ # Poewred by text
{ :text=>'<a href="http://www.zimplit.org/" class="">Powered&nbsp;by Zimplit CMS</a>' },

# Unknown Template # http://www.templateworld.com/ # Powered by text
{ :text=>'Powered by <A class="" href="http://www.zimplit.org/">Zimplit CMS</A>' },

# Unknown Template # http://www.freecsstemplates.org/ # Powered by text
{ :text=>'Powered by <a href="http://www.zimplit.org/" class="">Zimplit CMS</a>' },

# Unknown Template # Powered by text
{ :text=>'Powered by <A href="http://www.zimplit.org/">Zimplit CMS</A>' },

]

end

