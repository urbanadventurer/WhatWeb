##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2012-10-08 #
# Added version detection
# Added 'groupoffice' cookie match
##
Plugin.define "Group-Office" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.2"
description "Share projects, calendars, files and e-mail online with co-workers and clients. Easy to use and fully customizable, Group-Office takes online collaboration to the next level. - homepage: http://www.group-office.com/"

# ShodanHQ results as at 2012-10-08 #
# 309 for groupoffice

# Google results as at 2012-10-08 #
# 239 for "Powered by Group-Office" "Copyright" "Intermesh" "2003"

# Dorks #
dorks [
'"Powered by Group-Office" "Copyright" "Intermesh" "2003"'
]

# Examples #
examples %w|
62.97.115.212
31.195.136.83
46.105.229.149
213.73.91.209
195.202.159.122
62.43.212.115
87.98.235.156
84.54.187.84
202.57.140.227
www.group-office.com/groupoffice/
demo.group-office.com/groupoffice/
demo.group-office.eu
go.gabou.net
go.notalisle.fr
gruenzweigs.de
gys.uwkantooronline.nu
ict-eqep.com/groupoffice/
intern.digitalartists.de
office.sawyershome.co.uk/groupoffice/
yanrehsos.depsos.go.id/intranet/
www.backupnu.nl
www.bdagenda.net
www.dltvlaw.com/groupoffice/
www.enteringenieria.com.ar/goffice/
www.group-office.org
www.investinislam.com.au/go/
www.puechel.net/groupoffice/
www.rhein-sieg-office.de
www.slimoffice.nl
www.tbidirectagenda.info
www.wrightwaycommunications.com.au/gp/
biotreat-eu.org/extra/
www.nagra.com/go/
groupoffice.african-court.org
intranet.datalife.cz
www.heinztree.com/groupoffice/
tenutadeangelis.no-ip.com/gruppo/
demo.recruity.com
webmail.adomnes.com
office.sawyershome.co.uk/groupoffice/
https://mercury.jncasr.ac.in/go/index.php
https://kab-paderborn.dyndns.org/groupoffice/index.php
https://falz.dyndns.org/team/
https://sozdia.dyndns.org/groupoffice/index.php
|

# Matches #
matches [

# groupoffice Cookie
{ :search=>"headers[set-cookie]", :regexp=>/groupoffice=[^;]+;/ },

# ./index.php # Login Page # JavaScript # Version Detection
{ :version=>/GO\.settings=\{[^\}]+"theme":"[^"]+","product_name":"Group-Office","product_version":"([^"^\s]+)","host":"/ },

# ./themes/Default/images/favicon.ico # Default favicon
{ :md5=>"6cbe55dd826fe9e2e4306d5a5672382f", :url=>'themes/Default/images/favicon.ico' },

# HTML comment
{ :text=>'<!-- include everything after the loading indicator -->' },

# Meta description
{ :text=>'<meta name="description" content="Take your office online. Share projects, calendars, files and e-mail online with co-workers and clients. Easy to use and fully customizable, Group-Office takes online colaboration to the next level." />.' },

# Powered by text
{ :text=>'<a style="color: white;" target="_blank" href="http://www.group-office.com">powered by Group-Office</a>' },
{ :text=>'Powered by Group-Office: <a target="_blank" class="normal-link" href="http://www.group-office.com">http://www.group-office.com</a>' },

# Default Javascript
{ :text=>"alert('The Group-Office javascripts were not loaded. Check the host property in config.php and see if the file_storage_path folder and it\\'s contents are writable');" },
{ :text=>"alert('Could not load the application javascripts. Check the \"host\" property in config.php and see if the \"file_storage_path\" folder and it\\'s contents are writable');" },

]

end

