##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Group-Office" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "Share projects, calendars, files and e-mail online with co-workers and clients. Easy to use and fully customizable, Group-Office takes online collaboration to the next level. - homepage: http://www.group-office.com/"

# 53 results for "powered by Group Office" @ 2010-09-18
examples %w|
demo.group-office.com/groupoffice/
demo.group-office.eu
demo.opensourcecms.com/groupoffice/
go.gabou.net
go.notalisle.fr
gruenzweigs.de
gys.uwkantooronline.nu
ict-eqep.com/groupoffice/
intern.digitalartists.de
istdasnicht.org/office/
office.sawyershome.co.uk/groupoffice/
universal-research.org/groupoffice/
yanrehsos.depsos.go.id/intranet/
www.imnw.org/groupoffice/
www.backupnu.nl
www.bdagenda.net
www.dltvlaw.com/groupoffice/
www.enteringenieria.com.ar/goffice/
www.geopromining.com/office/
www.group-office.org
www.investinislam.com.au/go/
www.puechel.net/groupoffice/
www.rhein-sieg-office.de
www.slimoffice.nl
www.tbidirectagenda.info
www.tranzmorphic.com
www.wrightwaycommunications.com.au/gp/
|

matches [

# Default favicon
{ :md5=>"6cbe55dd826fe9e2e4306d5a5672382f", :url=>'themes/Default/images/favicon.ico' },

# HTML comment
{ :text=>'<!-- include everything after the loading indicator -->' },

# Meta description
{ :text=>'<meta name="description" content="Take your office online. Share projects, calendars, files and e-mail online with co-workers and clients. Easy to use and fully customizable, Group-Office takes online colaboration to the next level." />.' },

# Powered by text
{ :text=>'<a style="color: white;" target="_blank" href="http://www.group-office.com">powered by Group-Office</a>' },
{ :text=>'Powered by Group-Office: <a target="_blank" class="normal-link" href="http://www.group-office.com">http://www.group-office.com</a>' },

# Default Javascript
{ :text=>"alert('The Group-Office javascripts were not loaded. Check the host property in config.php and see if the file_storage_path folder and it\'s contents are writable');" },
{ :text=>"alert('Could not load the application javascripts. Check the \"host\" property in config.php and see if the \"file_storage_path\" folder and it\'s contents are writable');" },

]

end

