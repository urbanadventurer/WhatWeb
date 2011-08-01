##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpLDAPadmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-01
version "0.1"
description "phpLDAPadmin (also known as PLA) is a web-based LDAP client. It provides easy, anywhere-accessible, multi-language administration for your LDAP server.  - Homepage: http://phpldapadmin.sourceforge.net/"

# Google results as at 2011-08-01 #
# 227 for "Home" "Purge caches" intitle:phpLDAPadmin

# Dorks #
dorks [
'"Home" "Purge caches" intitle:phpLDAPadmin'
]

# Examples #
examples %w|
wurley.demo.phpldapadmin.org/php5-1.2/
ldapadmin.limoilux.org
www4.ensiie.fr
courier.ngi.de
stonge-family.com
phpadmin.cnr.it
ldap.culture.u-bordeaux1.fr
w3.hjdt.de/htdocs/index.php
www.albaco.com.pe/ldapadmin/htdocs/index.php
mohawk.santhe.nl/phpldapadmin/
nickatkins.net/ldap/
grid.ct.infn.it/phpldapadmin/htdocs/
www.physics.ua.ac.be/~casteels/phpldapadmin/htdocs/tree.php
supernet.ao/htdocs/tree.php
www.zmbh.uni-heidelberg.de/phpldapadmin/htdocs/tree.php
mx3.ncf.ca/ldapadmin/
lesnouveauxdisparus.org/phpldapadmin/tree.php
https://nexus.qualitis.hu/phpldapadmin/
https://ldap.dvo.ru/
https://www.ucimc.org/
https://ssl.pierrefitte93.fr/ldapadmin/
https://www.asso.ups-tlse.fr/phpldapadmin/htdocs/tree.php
https://www.spartacusse.org/phpldapadmin/
https://www.sub.unibe.ch/phpldapadmin/htdocs/tree.php
https://intranet.datef.it/phpldapadmin/htdocs/
https://webmail.math.cnrs.fr/admin/index.php
https://wineme.fb5.uni-siegen.de/benutzerverwaltung/
https://ldap.nux.cz/cmd.php
https://hosts.sic.rm.cnr.it/ldapadmin/htdocs/
https://ewr-openldap-n1.mediamath.com/phpldapadmin/
https://ldap.gippnet.de/index.php
scs.earlham.edu/phpldapadmin/tree.php
in1.ee.ncu.edu.tw/phpldapadmin/htdocs/cmd.php
is3.grid.iu.edu/phpldapadmin/htdocs/cmd.php
https://www.math.osu.edu/ldap/
https://swise.fau.edu/ldapadmin_tst4/tree.php
https://teco141pc.teco.edu/phpldapadmin/index.php
www.tribctas.gba.gov.ar/sistemas/pla/
https://id.asti.dost.gov.ph/phpldapadmin/
|

# Matches #
matches [

# Version Detection # Frameset # Seen on versions 0.9.x and not 1.x
{ :version=>/<head><title>phpLDAPadmin - ([^\s^<]+)[\s]?<\/title><\/head>/ },

# Version Detection # tree.php # Seen on versions 0.9.x and not 1.x
{ :version=>/<h3 class="subtitle" style="margin:0px">phpLDAPadmin - ([^\s^<]+)/ },

# Version Detection # Title
{ :version=>/<title>phpLDAPadmin \(([^\s^\)]+)\) - <\/title>/ },

# Version Detection # div id="ajFOOT"
{ :version=>/<div id="ajFOOT">([^\s^<]+)<\/div><a href="https:\/\/sourceforge\.net\/projects\/phpldapadmin">/ },

# LDAP Server Name Detection
{ :string=>/<td class="icon"><img src="images\/[^\/^"]*\/server.png" alt="Server" \/><\/td><td class="name" colspan="2">([^<]+)<\/td><\/tr>/ },

]

end

