##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OrangeHRM" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-18
version "0.1"
description "OrangeHRM - Open Source Human Resource Management Software (HRMS) - Homepage: http://www.orangehrm.com/"

# ShodanHQ results as at 2012-05-18 #
# 5 for symfony/web/index.php/auth/login

# Google results as at 2012-05-18 #
# 242 for "OrangeHRM ver" "OrangeHRM Inc." "All rights reserved."
#  25 for "OrangeHRM ver" "OrangeHRM Inc." "All rights reserved." intitle:"OrangeHRM Web Installation Wizard"
#  13 for inurl:"symfony/web/index.php/auth/login"

# Dorks #
dorks [
'"OrangeHRM ver" "OrangeHRM Inc." "All rights reserved."'
]

# Examples #
examples %w|
demo26.orangehrm.com/symfony/web/index.php/auth/login
demo.orangehrmlive.com/symfony/web/index.php/auth/login
demos1.softaculous.com/OrangeHRM/symfony/web/index.php/auth/login
www.khfoges.com.sg/hrm/index.php
110.77.143.163
80.169.74.43
ciat.org:8080
baf.xoom.it
200.40.68.134:210/orangehrm2/
pdavmeh.freeiz.com/orangehrm/
ec2-79-125-34-155.eu-west-1.compute.amazonaws.com/orange/index.php
apps.agileconcept.co.uk/_orangehrm/
www.hrm.b.gp
www.baf.c.gp
www.zahlelife.com/Programs/orangehrm/
impactomx.com/rhs/
81.98.185.138/orangehrm/
apps.agileconcept.co.uk/_orangehrm/
www.nganson.com.vn/installer/installerUI.php
idealhost.org/hrm/
www.gaychatnow.info/jobs/
200.40.68.134:210/orangehrm2/
apps.agileconcept.co.uk/_orangehrm/
hrm.net84.net
intranet.nfi.or.th/orangehrm/symfony/web/index.php/auth/login
www.ehabich.com/recursos/symfony/web/index.php/auth/login
hrm.twilightinfosoft.com/symfony/web/index.php/auth/login
afour.co.za/orangehrm2/symfony/web/index.php/auth/login
apps.spm.co.id:81/hrm/symfony/web/index.php/auth/login
greatlakesassociates.com/symfony/web/index.php/auth/login
kalcogroup.net/symfony/web/index.php/auth/login
www.saas-consulting.com:81/orangehrm/symfony/web/index.php/auth/login
|

# Matches #
matches [

# Install Page # Heading # Version Detection
{ :version=>/<div id="content">\s+<h2>Welcome to the OrangeHRM ver ([^\s]+) Setup Wizard<\/h2>/ },

# Install Page # Footer # Web Installation Wizard Version Detection
{ :module=>/<div id="footer"><a href="http:\/\/www\.orangehrm\.com" target="_blank" tabindex="[^"^>]*">OrangeHRM<\/a> (Web Installation Wizard ver [^\s]+) &copy; OrangeHRM Inc/ },

# Login Page # input hdnUserTimeZoneOffset
{ :text=>'<input type="hidden" name="hdnUserTimeZoneOffset" id="hdnUserTimeZoneOffset" value="0" />' },

# Login Page # Footer # Version Detection
{ :version=>/<div id="divFooter" >\s+<span id="spanCopyright">\s+<a href="http:\/\/www\.orangehrm\.com" target="_blank">OrangeHRM<\/a>\s+ver ([^&]+) &copy; OrangeHRM Inc/ },

# Login Page # Footer # Version Detection # Old Versions # Probably < 2.x
{ :version=>/<td align="center"><a href="http:\/\/www\.orangehrm\.com" target="_blank">OrangeHRM<\/a> ver ([^\s]+) &copy; OrangeHRM Inc/ },

]

end

