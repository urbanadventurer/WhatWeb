##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsoft Remote Web Workplace" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-30
version "0.1"
description "The Remote Web Workplace is a feature of Microsoft's Windows Small Business Server and the midsize business-focused product, Windows Essential Business Server, which enables pre-created users to log in to a front-end network-facing interface of the small business server. - homepage: http://microsoft.com/"

# 48 Google results for "In order to use all of the features available in Remote Web Workplace, you must enable JavaScript for your Web browser." @ 2010-12-30
# 6 ShodanHQ results for /Remote/logon.aspx ReturnUrl=%2fRemote @ 2010-12-30
examples %w|
https://paineirasinvestimentos.com.br/remote/
https://www.kbaonline.com/Remote/
https://remote.rosssteel.com/remote/
https://mail.bsiengr.com/
http://212.130.208.154/
http://www.lamb-kawakami.com/remote/
http://www.blandclinic.net/
https://aereldesign.net/Remote/
http://txmouser.com/
http://downeyspacecenter.org/
https://mail.escrotrans.com/
https://extranet.softnet.ca.it/remote/
https://remote.delawarearchitectsllc.com/
https://remote.synopus.no/remote/
http://mail.allfast.com/Remote/
http://rrgllc.com/Remote/
https://remote.ciampamedical.com/remote/
https://remote.thelander.info/
http://remote.croet.com/
http://remote.dataexplorer.hu/
http://remote.littledranttel.com/
https://remote.montanaacademy.com/
https://mail.excellent-networks.com/
https://mail.jnjtech.net/
https://www.worksmart.dk/
https://linea.mk/remote/
https://remote.slswchq.com/
https://remote.azpost.gov/remote
http://mail.ams-sourcing.com/
https://remote.salesdelvalle.com.mx/remote/
https://celebrating-you.org/Remote/
https://mail.rudolfhorvat.com.au
https://webmail.bsginc.biz
https://mail.mosesrest.co.il
https://mail.lupusconsulting.com
https://remote.latouchepediatrics.net/remote/
http://mail.faithluth.org/
https://remote.etspl.in/
http://remote.serenitygroup.com/
http://remote.teamkuptz.com/
http://mail.popmanufacturing.com/
|

matches [

# Default title and stylesheet tags
{ :text=>'</title><link href="signinStyle.css" rel="stylesheet" type="text/css" />' },

# Default form tag HTML
{ :regexp=>/<form name="form1" method="post" action="logon.aspx?ReturnUrl=%2f[^"]" id="form1" autocomplete="OFF" onsubmit="OnUserNameFocus\(\);">/ },

# Default remember me link
{ :text=>'<input id="rememberMe" type="checkbox" name="rememberMe" tabindex="3" /><label for="rememberMe">Remember me on this computer</label>', :certainty=>25 },

# Default meta copyright
{ :text=>'<meta name="copyright" content="Copyright (c) Microsoft Corporation.  All rights reserved." />', :certainty=>25 },

# Default head, meta content and title
{ :text=>'<head id="Head1"><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>', :certainty=>25 },

]

end


