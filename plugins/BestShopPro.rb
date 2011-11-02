##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BestShopPro" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-02
version "0.1"
description "BestShopPro - Homepage: http://www.bst.pl/"

# Google results as at 2011-11-02 #
# 157 for inurl:"pokaz_podkat.php?idkat="
# 107 for intitle:"Powered By BST"

# Dorks #
dorks [
'inurl:"pokaz_podkat.php?idkat="'
]

# Examples #
examples %w|
http://www.demo.bst.pl/
http://www.demo.bst.pl/admin
http://meteoryty.sklepna5.pl/admin/
http://www.lincoln.sklep.pl/shop/pokaz_podkat.php
http://www.witalis.sklepna5.pl/pokaz_podkat.php
http://www.bmw.ewor.pl/pokaz_podkat.php
http://www.weitec.pl/pokaz_podkat.php
http://www.stalchem.sklepna5.pl/pokaz_podkat.php
http://futuresport.com.pl/pkat/61/spodenki.html
http://www.motosklep.net/towar/245/q-horse-power-5w-20-api-sm-1l.html
http://www.drzeweczka.com/kat/10/cyprysiki-chamaecyparis.html
http://www.drzeweczka.com/kat/4/cisy-taxus.html
http://www.alka.pl/sklep/pokaz_produkty.php
http://www.draiv.pl/pokaz_produkt.php
|

# Matches #
matches [

# Login Page
{ :text=>'<td width=300 height=18 colspan=2 align=center class=tdn><b>Logowanie</b></td></tr>' },

# Meta Author
{ :text=>'<meta content="www.bst.pl" name="author"/>' },
{ :text=>'<META CONTENT="www.bst.pl" NAME=AUTHOR>' },

]

end

# This plugin requires more matches

