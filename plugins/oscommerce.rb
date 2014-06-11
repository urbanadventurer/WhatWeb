##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-07-07 #
# updated regex and added google dorks
##
# Version 0.3
# remove :certainty and :name
##
Plugin.define "OSCommerce" do
author "Andrew Horton"
version "0.4"
description "Open Source Ecommerce System in PHP. It was first released in March 2000 as 'The Exchange Project'. Branched projects include : Ian's Loaded, ZenCart, CRE Loaded,   http://www.oscommerce.com. This plugin recognises security warnings for file permissions and the installation directory. Aggressive plugin attempts to get version from /admin/login.php page."

# ShodanHQ results #
# 9,154 for cookie_test=please_accept_for_session

# Google results #
# 800 for "Powered by osCommerce"
# 69 for inurl:"extras/update.php" -display
# 22 for inurl:"/admin/configuration.php?" Mystore
# 14 for intitle:osCommerce inurl:admin intext:"redistributable under the GNU" intext:"Online Catalog" -demo -site:oscommerce.com

# Dorks #
dorks [
'"Powered by osCommerce"',
'inurl:"extras/update.php" -display'
]



# Matches #
matches [

# 'osCsid=' in link tag, length 26|32
{ :regexp=>/<[^>]+(src|href)\s*=\s*[^>]\bosCsid=([a-z0-9]{26}|[a-z0-9]{32})/ },

# The Exchange Project - Community Made Shopping!
{ :certainty=>25, :text=>'The Exchange Project - Community Made Shopping!'},

# Security Warning
{ :string=>"warning", :text=>'<td class="messageStackWarning"><img src="images/icons/warning.gif"'},

# Version Detection # /admin/login.php
{ :version=>/<img src="images\/oscommerce.png" border="0" alt="osCommerce ([^"]+)"/, :url=>"/admin/login.php",:name=>"admin page version" },

# Powered by text
{ :text=>'Powered by <a href="http://www.oscommerce.com" target="_blank">osCommerce</a>' },

# cookie_test Cookie
{ :search=>"headers[set-cookie]", :text=>'cookie_test=please_accept_for_session;' },

# osCsid Cookie
{ :search=>"headers[set-cookie]", :regexp=>/osCsid=[a-z0-9]{32};/ },

]

end

=begin

# The Exchange Project - Community Made Shopping!
#$Id: whos_online.php, v 1.0 2001/12/05 by mattice@xs4all.nl
# Set-Cookie: osCsid=c85f6adba3b454436849750b3a1a1c47;
# .php?osCsid=69714fbf4c4d737b36631506b1629db0
#


# version:

# <!-- start bestsellersbox_only //--> after 12/02/2000 The Exchange Project Preview Release 2.0
# <!-- currencies //--> after 03/06/2001 The Exchange Project Preview Release 2.1

#Powered by <a href="http://www.oscommerce.com" target="_blank">osCommerce</a>
#<img src="/images/poweredby.gif" width="77" height="30" vspace="0" hspace="0" border="0" alt="Powered by osCommerce">
#

# <img src="images/oscommerce.png" border="0" alt="osCommerce Online Merchant v2.2 RC2a" title=" osCommerce Online Merchant v2.2 RC2a ">

# osCommerce Online Merchant Copyright &copy; 2007 <a href="http://www.oscommerce.com" target="_blank">osCommerce</a><br>
# E-Commerce Engine Copyright &copy; 2003 <a href="http://www.oscommerce.com" target="_blank">osCommerce</a><br>
# osCommerce Online Merchant Copyright &copy; 2008 <a href="http://www.oscommerce.com" target="_blank">osCommerce</a><br>

# <td align="center" class="smallText">Powered by <a href="http://www.oscommerce.com" target="_blank">osCommerce</a></td>
# <td align="center" class="smallText">Powered by <a href="http://www.oscommerce.com" target="_blank">osCommerce</a></td>


# older versions:
# doesn't seem to be normal OSCommerce: with 26long code: www.telepiscinas.com-catalog-index.php www.cleanshop.hu-clean-index.php atlantasolar.com
# www.crowdcontroldepot.com


CHANGELOG

# http://svn.oscommerce.com/fisheye/browse/~raw,r=1832/osCommerce/oscommerce2/trunk/CHANGELOG

# 03/12/2000 The Exchange Project Preview Release 1.0
# 05/14/2000 The Exchange Project Preview Release 1.1
# 12/02/2000 The Exchange Project Preview Release 2.0
# 12/13/2000 The Exchange Project Preview Release 2.0a
# 03/06/2001 The Exchange Project Preview Release 2.1
# 02/17/2003 osCommerce 2.2 Milestone 1
# 12/07/2003 osCommerce 2.2 Milestone 2
# 11/12/2005 osCommerce 2.2 Milestone 2 Update 051112
# 11/13/2005 osCommerce 2.2 Milestone 2 Update 051113
# 08/17/2006 osCommerce 2.2 Milestone 2 Update 060817
# 07/03/2007 osCommerce Online Merchant 2.2 RC1
# 01/16/2008 osCommerce Online Merchant 2.2 RC2
# 01/30/2008 osCommerce Online Merchant 2.2 RC2a


Admin Page

# <img src="images/oscommerce.png" border="0" alt="osCommerce Online Merchant v2.2 RC2" title=" osCommerce Online Merchant v2.2 RC2 ">
# Copy 2008
# <img src="images/oscommerce.png" border="0" alt="osCommerce Online Merchant v2.2 RC1" title=" osCommerce Online Merchant v2.2 RC1 ">
# Copy 2007
# <img src="images/oscommerce.png" border="0" alt="osCommerce Online Merchant v2.2 RC2a" title=" osCommerce Online Merchant v2.2 RC2a ">
# Copy 2008


ERRORS

# <td class="messageStackWarning"><img src="images/icons/warning.gif" border="0" alt="Advertencia" title=" Advertencia " width="10" height="10">&nbsp;Advertencia: El directorio de instalaci&oacute;n existe en: /storage/mijndomein/users/068763/public/sites/www.drukwerkzone.nl/install. Por razones de seguridad, elimine este directorio completamente.</td>

# <td class="messageStackWarning"><img src="images/icons/warning.gif" border="0" alt="Warning" title=" Warning " width="10" height="10">&nbsp;Warning: Installation directory exists at: /storage/mijndomein/users/068763/public/sites/www.drukwerkzone.nl/install. Please remove this directory for security reasons.</td>

# <td class="messageStackWarning"><img src="images/icons/warning.gif" border="0" alt="Warning" title=" Warning " width="10" height="10">&nbsp;Warning: I am able to write to the configuration file: /storage/mijndomein/users/068763/public/sites/www.drukwerkzone.nl/includes/configure.php. This is a potential security risk - please set the right user permissions on this file.</td>

=end

