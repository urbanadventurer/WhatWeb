##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SugarCRM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-02
version "0.1"
description "Commercial open source customer relationship management (CRM). CRM software for sales force automation and customer support deployed on demand or on site. - Homepage: http://www.sugarcrm.com/crm/"

# Google results as at 2011-04-02 #
# 34 for "Welcome to" intitle:SugarCRM "SugarCRM Inc. The Program is provided AS IS, without warranty. Licensed under AGPLv3."

# Examples #
examples %w|
demos.softaculous.com/SugarCRM/index.php
www.portalondemand.biz/demo/sugarcrm/index.php
88.255.154.13/sugarcrm/
letrium.com/sugarcrm_demo/
www.cornerstonemg.org/crm/
69.70.67.46/sugarcrm/
theoverfifties.com/crm/
auriga-si.com/SugarCRM/
carsforsalefinder.com/crm/
nationalhealthplus2.com
ec2-184-73-47-191.compute-1.amazonaws.com/sugarcrm/
ec2-75-101-205-77.compute-1.amazonaws.com/sugarcrm/
compasstsi.com/Sugarcrm/
lht-systems.net/SugarCrm/
flourish92.com/office/
brmg.us/sugar/
www.pcservicesv.com/crm/
austcocrm.com/austco/
www.voxa.biz/CRM/
msbsupport.org/sugarcrm/
www.disasterdatabase.org/crm/
attitudeindia.co.in/SugarCE-Full-6.0.0/
www.retailerservices.us
https://www.conectiva.com.br/sugarcrm/
https://www.ronchi.to/sugarcrm/
|

# Matches #
matches [

# XSRF Warning Message
{ :text=>"<h3 style='color:red'>Possible Cross Site Request Forgery (XSRF) Attack Detected</h3>" },

# Login Page # Support link
{ :text=>'<span>|</span>    <a href=" javascript:void window.open(\'http://support.sugarcrm.com\')">Support</a>' },

# JavaScript
{ :text=>"<script>var module_sugar_grp1 = 'Users';</script><script>var action_sugar_grp1 = 'Login';</script><script>jscal_today" },

# Theme Detection
{ :module=>/<script type="text\/javascript">[\s]+<!--[\s]+SUGAR\.themes\.theme_name      = '([^']+)';[\s]+SUGAR\.themes\.theme_ie6compat = / },

# Powered by image
{ :text=>"<img style='margin-top: 2px' border='0' width='106' height='23' src='include/images/poweredby_sugarcrm.png' alt='Powered By SugarCRM'>" },

# Year Detection
{ :string=>/\* SugarCRM is a customer relationship management program developed by[\s]+ \* SugarCRM, Inc\. Copyright \(C\) 2004-([\d]{4}) SugarCRM Inc\./ },

]

end


