##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Exponent-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "Out of thebox, Exponent Content Management System touts a feature-rich assortment of tools to assist you in your online content management. Requirements: Apache 1.3, 2.0, or 2.2, PHP 4.4 or later, PHP GD Image Library extension, MySQL 4.1.22 or later - homepage: http://www.exponentcms.org/index.php?section=116"

# 94 results for "powered by Exponent CMS" @ 2010-10-15
examples %w|
beyondthebeatenpath.com
fortwayneworkingdog.org
noiraonline.org
www.3riversworkingdog.org
www.abinfo.com.br
www.chapmanqualityroofing.co.uk
www.circleofbusiness.org
www.consult-avatar.com
www.danjim.com.au
www.englishdrama-trier.de
www.heritagescience.ac.uk
www.metalmar.net/exp/
www.path3.com
www.rcfrn.org/cms/
www.ridgeworks.ca
www.riia.ro
|

matches [

# Version detection # Version detection
{ :version=>/<meta name="Generator" content="Exponent Content Management System - ([^\"]+)"/ },

# Meta generator
{ :text=>'<meta name="Generator" content="Exponent Content Management System' },

# Powered by text
{ :text=>'Powered by <a href="http://www.exponentcms.org">Exponent CMS</a>' },
{ :text=>'<a href="http://www.exponentcms.org">Powered by Exponent CMS</a>' },

]

end

