##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "PHP-Live" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.2"
description "PHP Live! enables live help and live customer support communication directly from your website. - homepage: http://www.phplivesupport.com/"

# Google results as at 2010-08-31 #
# 158 for "powered by PHP Live!" -Vulnerability
# 7   for "powered by PHP Live!" intitle:"Knowledge BASE (FAQ)" inurl:knowledge_search.php
# 14  for "powered by PHP Live!" (intitle:"Request Live! Support"|"Please leave a message") inurl:request_email.php

# Examples #
examples %w|
74.208.90.54:400/rep.ipmanage.net/httpdocs/phplive/admin/traffic/knowledge_search.php
jswcrm.com/livechat/request_email.php
lib207.lib.wwu.edu/phplive/request_email.php
live.trainingjolt.com/request_email.php
livehelp.vi.virginia.gov/admin/traffic/knowledge_search.php
livehelp.preferred-care-pharmacy.com/message_box.php
phplive.prostarcrm.com/message_box.php
phplive.sig-support.com/rus/admin/traffic/knowledge_search.php
secure.westnic.net/livesupport/request_email.php
talk.lifechurch.tv/phplive/request_email.php
www.megrisoft.com/livesupport/request_email.php
www.activitydirectorsnetwork.com/phplive/admin/traffic/knowledge_search.php
www.vividracing.com/phplive/request_email.php
www.lccavia.ru/support/request_email.php
www.hthengineering.com/phplive/message_box.php
www.phplivesupport.co.uk/phplive/admin/traffic/knowledge_search.php
www.activitydirectorsnetwork.com/phplive/admin/traffic/knowledge_search.php
www.nutridirect.co.uk/phplive/admin/traffic/knowledge_search.php
www.indecenciashop.com.br/phplive/admin/traffic/knowledge_search.php
www.guestcentric.com/support/request_email.php
www.toureast.com/en/chatlive/request_email.php
www.edunet-help.com/request_email.php
www.lbsib.com/support/request_email.php
www.hotelangelshome.com/support/request_email.php
www.robotsetup.com/support/request_email.php
|

# Matches #
matches [

# Javascript
{ :text=>'// image is NOT CACHED (Netscape problem).  keep this or bad things could happen' },

# HTML Comments
{ :text=>'<!-- copyright OSI Codes Inc. http://www.osicodes.com [DO NOT DELETE] -->' },
{ :text=>'<!-- copyright OSI Codes, http://www.osicodes.com [DO NOT DELETE] -->' },
{ :text=>'<!-- BEGIN PHP Live! Code, copyright 2001 OSI Codes -->' },
{ :text=>'<!-- END PHP Live! Code, copyright 2001 OSI Codes -->' },

# FAQ # Default Title
{ :text=>'<title> Knowledge BASE (FAQ) </title>' },

# Error page
{ :text=>'<font color="#FF0000">[Configuration Error: config files not found!] Exiting' },

# Version Detection # Powered by text
{ :version=>/	<div id="copyright">Powered by <a href='http:\/\/www.phplivesupport.com\/\?link' target='newwin'>PHP Live\!<\/a>  v([\d\.]+) &copy; OSI Codes Inc.<\/div>/ },

]

end

