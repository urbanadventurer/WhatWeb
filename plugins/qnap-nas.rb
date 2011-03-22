##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2011-03-22 #
# Added extra_urls
# Removed aggressive section in favor of using passive with extra_urls
##
# Version 0.3 #
# Added aggressive model, firmware and module extraction from /cgi-bin/authLogin.cgi
##
# Version 0.2 #
# Added passive model, firmware and module extraction support for /cgi-bin/authLogin.cgi
## 
Plugin.define "QNAP-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.4"
description "QNAP provides a series of network attached storage (NAS) products - homepage:http://www.qnap.com/"

# Tested on TS Models:
#   TS-109 PRO, TS-109 PRO II, TS-119, TS-209 PRO, TS-209 PRO II,
#   TS-219, TS-239, TS-259, TS-409, TS-410U, TS-419P, TS-509, TS-559, TS-639

# Google results as at 2011-03-22 #
# 229 for inurl:Qmultimedia/cgi-bin/thumb_index.cgi

# Examples #
examples %w|
http://140.113.74.103:8080/cgi-bin/
http://203.72.160.21:8080/cgi-bin/
http://163.19.88.200:8080/cgi-bin/
http://140.123.174.172:8080/cgi-bin/
http://163.22.115.180:8080/cgi-bin/
http://120.107.162.9:8080/cgi-bin/
http://www.guillerault.eu:8080/cgi-bin/
http://119.247.13.81:8080/cgi-bin/
http://sousedi.cz:8088/cgi-bin/
http://www.jgirado.com/cgi-bin/
http://www.belleandku.info:8080/cgi-bin/
http://dasistsehr.net:8080/cgi-bin/
http://harrelsonsplace.com:8080/cgi-bin
http://www.thatsyummymummy.com:8080/cgi-bin/
https://rovingjungs.net/cgi-bin/
http://www.didadi.info:8080/cgi-bin/
https://www.mindache.com/cgi-bin
http://pixelhunger.com:8080/cgi-bin/
http://eendje.org:8080/cgi-bin/
http://jan.portinga.eu:8080/cgi-bin/
http://www.jgrimes.co.uk:8080/cgi-bin/
http://www.silud.com:8080/cgi-bin/
http://www.zeising.net:8080/cgi-bin/
http://www.momocable.com:8080/cgi-bin/
https://qnap.expanic.com/cgi-bin/
http://193.147.58.206:8080/cgi-bin/
http://www.hakkahome.com:10101/cgi-bin/
http://philipsenechal.com:8080/cgi-bin/
https://mdelattre.com/cgi-bin/
http://melkes.net:8080/cgi-bin/
http://123.204.252.119:8080/cgi-bin/
http://legendav.dynalias.com:8080/cgi-bin/
http://train-to-attain.com:8080/cgi-bin/
http://114.32.115.33:8080/cgi-bin/
http://219.87.144.203:8080/cgi-bin/
http://www.stehagen.se:8080/cgi-bin/
http://www.air-village.com:8080/cgi-bin/
http://www.liwei.de:8080/cgi-bin/
http://60.251.202.110:8080/cgi-bin/
http://www.marcjones.co.uk:8080/cgi-bin/
http://www.nightleo.com:8080/cgi-bin/
http://www.infotronic-service.com/cgi-bin/
http://ekodagitim.com.tr:8080/cgi-bin/
https://www.johos.se/cgi-bin/
http://www.smaal.nu:8080/cgi-bin/
http://www.dickyfamily.com:3737/cgi-bin/
http://www.imetek.com:8080/cgi-bin/
http://www.ikke.net:8080/cgi-bin/
http://www.heathens.ca:8080/cgi-bin/
https://hdproserveur.com/cgi-bin/
http://www.andrewmacbeth.com:8080/cgi-bin/
https://www.vanmaurik.org/cgi-bin/
http://92.79.132.123:8080/cgi-bin/
http://xn--c3tyik98bwox.net:8080/cgi-bin/
https://www.boskoe.com/cgi-bin/
http://163.27.57.9:8080/cgi-bin/
http://www.rhk4.com:8080/cgi-bin/
http://www.jr1186.com:8000/cgi-bin/
http://www.patvibes.com:6000/cgi-bin/
https://www.cpcupload.com/cgi-bin/
http://www.qwe4.net:8080/cgi-bin/
https://www.girlguide.org.sg/cgi-bin/
http://www.qwe4.com:8080/cgi-bin/
https://www.fluehmann.net/cgi-bin/
https://bahaykubo.info:8443/cgi-bin/
http://kwlo.webhop.net:8080/cgi-bin/
http://yaohaiping.net:8080/cgi-bin/
|

# Aggressive # Extra URLs #
extra_urls ["/cgi-bin/authLogin.cgi"]

# Matches #
matches [

# Multimedia Station # URL pattern
{ :ghdb=>'inurl:"Qmultimedia/cgi-bin/thumb_index.cgi" filetype:cgi', :module=>"Multimedia Station" },

# Photo Station module # Default title
{ :text=>"<title>QNAP Photo Station</title>", :module=>"Photo Station" },

# Download Station module # Default title
{ :text=>"<title>QNAP Download Station</title>", :module=>"Download Station" },

# Qmultimedia module # Default title
{ :text=>"<TITLE>QNAP Multimedia Station (Photo Album)</TITLE>", :module=>"Multimedia Station" },

# Qmultimedia module # Default title
{ :text=>"<TITLE>Multimedia Station</TITLE>", :module=>"Multimedia Station", :certainty=>75 },

# Login page # Default JavaScript
{ :certainty=>75, :text=>'NavPage("http://"+ location_hostname_for_ipv6(location.hostname) +":"+ qweb_port +"/", 0);' },

# Index redirect page # Default JavaScript
{ :certainty=>75, :text=>'location.href=pr+"://["+location.hostname+"]"+pt+redirect_suffix;' },
{ :regexp=>/^\/\/window.location = '\/indexnas\.cgi\?counter=' \+ Math\.floor\(\(diff1-diff2\)\/1000\);[\r\n]^window.location.replace\('\/indexnas\.cgi\?counter=' \+ Math\.floor\(\(diff1-diff2\)\/1000\)\);$/ },

# Login page # Default logo HTML
{ :text=>'<a href="http://www.qnap.com"><img src="/ajax_obj/images/qnap_logo_w.gif" alt="QNAP Turbo NAS" title="QNAP Turbo NAS"' },
{ :text=>'<td class="header_tb_logo"><img id=\'qlogo\' src="/ajax_obj/images/qnap_logo_dark.gif" width="158" height="75"></td>' },

# QNAP NAS # Not TS Series # Default table HTML
{ :text=>'<table width="100%" border="0" background="/v3_menu/images/admin_header.jpg" cellpadding="0" cellspacing="0" class="12-blue">', :model=>"Unknown Model (not TS Series)" },

# Login page # /cgi-bin/html/login.html # Extract modules
{ :text=>'<img id="img_webserver" src="/ajax_obj/images/login_main_2.jpg" longdesc="javascript:onQuickLinkChange(2);" alt="Web Server" />', :module=>"QWeb Server" },
{ :text=>'<img id="img_multimedia" src="/ajax_obj/images/login_main_3.jpg" longdesc="javascript:onQuickLinkChange(3);" alt="Multimedia Station" />', :module=>"Multimedia Station" },
{ :text=>'<img id="img_download" src="/ajax_obj/images/login_main_4.jpg" longdesc="javascript:onQuickLinkChange(4);" alt="Download Station" />', :module=>"Download Station" },
{ :text=>'<img id="img_webfile" src="/ajax_obj/images/login_main_5.jpg" longdesc="javascript:onQuickLinkChange(5);" alt="Web File Manager" />', :module=>"Web File Manager" },
{ :text=>'<img id="img_surveillance" src="/ajax_obj/images/login_main_6.jpg" longdesc="javascript:onQuickLinkChange(6);" alt="Surveillance Station" />', :module=>"Surveillance Station" },

]

# Passive #
def passive
	m=[]

	# /cgi-bin/authLogin.cgi # Check document is QNAP XML
	if @base_uri.path == "/cgi-bin/authLogin.cgi" and @body =~ /^<QDocRoot version="[\d\.]+">$/

		# Firmware Version Detection
		m << { :firmware=>@body.scan(/<version>(<!\[CDATA\[)?([^\]]+)(\]\]>)?<\/version>/)[0][1]+" build "+@body.scan(/<build>(<!\[CDATA\[)?([^\]]+)(\]\]>)?<\/build>/)[0][1] } if @body =~ /<version>(<!\[CDATA\[)?([^\]]+)(\]\]>)?<\/version>/ and @body =~ /<build>(<!\[CDATA\[)?([^\]]+)(\]\]>)?<\/build>/

		# Model Detection
		m << { :model=>@body.scan(/<internalModelName>(<!\[CDATA\[)?([^\]]+)(\]\]>)?<\/internalModelName>/)[0][1] } if @body =~ /<internalModelName>(<!\[CDATA\[)?([^\]]+)(\]\]>)?<\/internalModelName>/

		# Module Detection
		m << { :module=>"WebFS" } if @body =~ /<webFSEnabled>(<!\[CDATA\[)?1(\]\]>)?<\/webFSEnabled>/
		m << { :module=>"Multimedia Station" } if @body =~ /<QMultimediaEnabled>(<!\[CDATA\[)?1(\]\]>)?<\/QMultimediaEnabled>/
		m << { :module=>"MSV2" } if @body =~ /<MSV2Supported>(<!\[CDATA\[)?1(\]\]>)?<\/MSV2Supported>/
		m << { :module=>"MSV2 Web" } if @body =~ /<MSV2WebEnabled>(<!\[CDATA\[)?1(\]\]>)?<\/MSV2WebEnabled>/
		m << { :module=>"Download Station" } if @body =~ /<QDownloadEnabled>(<!\[CDATA\[)?1(\]\]>)?<\/QDownloadEnabled>/
		m << { :module=>"QWeb Server" } if @body =~ /<QWebEnabled>(<!\[CDATA\[)?1(\]\]>)?<\/QWebEnabled>/
		m << { :module=>"Qweb Server SSL" } if @body =~ /<QWebSSLEnabled>(<!\[CDATA\[)?1(\]\]>)?<\/QWebSSLEnabled>/
		m << { :module=>"NVR" } if @body =~ /<NVREnabled>(<!\[CDATA\[)?1(\]\]>)?<\/NVREnabled>/
		m << { :module=>"Web File Manager 2" } if @body =~ /<WFM2>(<!\[CDATA\[)?1(\]\]>)?<\/WFM2>/

	end

	# Return passive matches
	m

end

end

