##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenEMR" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-20
version "0.1"
description "OpenEMR is a Free and Open Source electronic health records and medical practice management application. - Homepage: http://www.open-emr.org/"

# ShodanHQ results as at 2011-10-20 #
# 1 for OpenEMR

# Google results as at 2011-10-20 #
# 38 for inurl:"interface/login/login_frame.php" ext:php

# Dorks #
dorks [
'inurl:"interface/login/login_frame.php" ext:php'
]

# Examples #
examples %w|
opensourceemr.com:2100/openemr/
www.generationhomecare.com/openemr/
utkarshsystem.com/openemr/
dev.personforce.net/openemr/
openemr.cybersims.com
maisondx.com/gomre/
emr.elethia.org
krpweb.com/openemr/
www.1-fast-cnc-production-factory.1000yrs.net/emr-company/
www.nilotaninaka.com/webmed/
https://www.emgdoctor.net/openemr-2.9.0/interface/login/login_title.php
https://wecanhelpout.net/emr/
https://aperioemr.mi-squared.com/openemr/
https://medical.seawinn.com/chiro/
|

# Matches #
matches [

# GHDB # URL Pattern
{ :certainty=>25, :ghdb=>'inurl:interface/login/login_frame.php filetype:php' },

# Redirect Page
{ :regexp=>/<body ONLOAD="javascript:top\.location\.href='interface\/login\/login_frame\.php(\?site=default)?';">/ },

# Version Detection # /interface/login/login_title.php
{ :version=>/type="text\/css">[\s]+<\/head>[\s]+<body class="body_title">[\s]+<span class="title_bar">[^<]+ v([^\s^<]+)<\/span><br>/ },

# Login Page # Frameset # HTML Comment
{ :regexp=>/<!--<frame src="\/[^\/]+\/interface\/login\/filler\.php" name="Filler Bottom" scrolling="no" noresize frameborder="NO">-->/ },

# OpenEMR Cookie
{ :certainty=>75, :search=>"headers[set-cookie]", :regexp=>/OpenEMR=[^\s]+;/ },

]

end

