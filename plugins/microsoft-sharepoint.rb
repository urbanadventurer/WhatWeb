##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Microsoft-Sharepoint" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "Microsoft SharePoint 2010 makes it easier for people to work together. Using SharePoint 2010, your people can set up Web sites to share information with others, manage documents from start to finish, and publish reports to help everyone make better decisions. - homepage: http://sharepoint.microsoft.com/"
examples %w|
sharepoint.microsoft.com
www.wssdemo.com
www.sharepointmadscientist.com
blog.tedpattison.net
www.heatherwaterman.com
www.cospug.com
www.sharepointgrind.com
www.nwcsupport.com
www.diegotrashcan.com
www.spfoxhole.com
www.sharepointkris.com
www.sp2010blog.com
www.cospug.net
www.bostonsharepointug.org
member.itknowledgesale.com
maventor.com
sharepoint.softwebsolutions.com
www.phillysharepoint.org
www.wssclassroom.com
www.russbasiura.com
www.blueberryit.co.nz
www.phillysharepoint.com
demo2010.binaryrepublik.com
blogs.rbaconsulting.com
www.joelstamey.com
www.baileypoint.com
|

matches [

# About 39,000 results @ 2010-06-05
{:name=>'GHDB: +"Please enable scripts and reload this page. If your browser does not support script, then you can visit the minimal version of this site at"',
:certainty=>75,
:ghdb=>'+"Please enable scripts and reload this page. If your browser does not support script, then you can visit the minimal version of this site at"'
},

{:name=>"default meta content",
:text=>'<meta name="GENERATOR" content="Microsoft SharePoint" /><meta name="progid" content="SharePoint.WebPartPage.Document" /><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="Expires" content="0" />'
}

]

end

