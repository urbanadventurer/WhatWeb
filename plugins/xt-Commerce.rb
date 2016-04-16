##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "xt-Commerce" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-15
version "0.1"
description "xt-Commerce is a powerfull Opensource e-Commerce Solution, written in php/SQL, with a smarty Template engine, and lots of features for a successfull e-commerce site."
website "http://www.xt-commerce.com/"
# Project Homepage: http://sourceforge.net/projects/xtcommerce/

# Google results as at 2011-02-15 #
# 22 for inurl:"xtc_check_stock_attributes.inc.php"

# Dorks #
dorks [
'inurl:"xtc_check_stock_attributes.inc.php"'
]



# Matches #
matches [

# Default HTML Comment # Matches XT-Commerce and most modifications
{ :regexp=>/<!--\n	This OnlineStore is brought to you by XT-Commerce, Community made shopping\n	XTC is a free open source e-Commerce System\n	created by Mario Zanier & Guido Winger and licensed under GNU\/GPL.\n	Information and contribution at http:\/\/www.xt-commerce.com\n-->/ },

# Meta Generator # Version Detection
{ :version=>/<meta name="generator" content="\(c\) by xt:Commerce v([^,]{1,15}) , http:\/\/www.xt-commerce.com" \/>/ },

# Meta Generator # eComBASE # http://www.ecombase.de/
{ :module=>/<meta name="generator" content="\(c\) by (eComBASE V[\d\.]{1,15}), http:\/\/www.ecombase.de\/" \/>/ },

# Meta Generator # xtcModified # http://www.xtc-modified.org/
{ :module=>/<meta name="generator" content="\(c\) by (xtcModified v[\d\.]{1,15}) dated: [\d]{4}-[\d]{2}-[\d]{2} , http:\/\/www.xtc-modified.org" \/>/ },
{ :text=>'<meta name="generator" content="(c) by xtcModified , http://www.xtc-modified.org" />', :module=>"xtcModified" },
{ :text=>'<meta name="generator" content="(c) by xtcModified ----- http://www.xtc-modified.org" />', :module=>"xtcModified" },

# Copyright HTML
{ :regexp=>/<div class="copyright">eCommerce Engine &copy; [\d]{4} <a href="http:\/\/www.xt-commerce.com[\/]?" target="_blank">xt:Commerce Shopsoftware<\/a>/ },

# Copyright HTML # eComBASE # http://www.ecombase.de/
{ :regexp=>/<div class="copyright"><a rel="follow" href="http:\/\/[^>^"]*\/ecombase.php" title="eComBASE licence">eComBASE<\/a> &copy; [\d]{4} based on /, :module=>"eComBASE" },

# Copyright HTML # xtcModified # http://www.xtc-modified.org
{ :module=>/<div class="copyright"><a href="http:\/\/www.xtc-modified.org" target="_blank">(xtcModified v[\d\.]{1,15}) dated: [\d]{4}-[\d]{2}-[\d]{2}<\/a>/ },
{ :text=>'<div class="copyright"><a href="http://www.xtc-modified.org" target="_blank">xtcModified</a>', :module=>"xtcModified" },

]

end


