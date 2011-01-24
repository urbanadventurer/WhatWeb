##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Tested on TS Models:
# TS-109 PRO, TS-109 PRO II, TS-119, TS-209 PRO, TS-209 PRO II,
# TS-219, TS-239, TS-259, TS-409, TS-410U, TS-419P, TS-509, TS-559, TS-639
##
# Version 0.3 #
# Added aggressive model, firmware and module extraction from /cgi-bin/authLogin.cgi
##
# Version 0.2 #
# Added passive model, firmware and module extraction support for /cgi-bin/authLogin.cgi
## 
Plugin.define "QNAP-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.3"
description "QNAP provides a series of network attached storage (NAS) products - homepage:http://www.qnap.com/"

# 3,990 results for inurl:Qmultimedia +thumb_index @ 2010-06-01
examples %w|
http://www.guillerault.eu:8080/cgi-bin/
http://119.247.13.81:8080/cgi-bin/
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
https://www.campatuk.com/cgi-bin/
http://89.249.13.85:8080/cgi-bin/
https://www.netzwerk-24.info/cgi-bin/
http://163.27.89.170:6000/cgi-bin/
https://www.girlguide.org.sg/cgi-bin/
http://www.qwe4.com:8080/cgi-bin/
http://www.mechnaplex.com:8080/cgi-bin/
https://www.fluehmann.net/cgi-bin/
http://ftp.peng.biz:8080/cgi-bin/
http://www.laluo.com:1975/cgi-bin/
http://87.254.33.5:8080/cgi-bin/
https://bahaykubo.info:8443/cgi-bin/
http://kwlo.webhop.net:8080/cgi-bin/
http://yaohaiping.net:8080/cgi-bin/
|

matches [

# Multimedia Station # URL pattern
{ :ghdb=>"inurl:Qmultimedia +thumb_index", :module=>"Multimedia Station" },

# Photo Station module # Default title
{ :text=>"<title>QNAP Photo Station</title>", :module=>"Photo Station" },

# Download Station module # Default title
{ :text=>"<title>QNAP Download Station</title>", :module=>"Download Station" },

# Qmultimedia module # Default title
{ :text=>"<TITLE>QNAP Multimedia Station (Photo Album)</TITLE>", :module=>"Multimedia Station" },

# Qmultimedia module # Default title
{ :text=>"<TITLE>Multimedia Station</TITLE>", :module=>"Multimedia Station", :certainty=>75 },

# Login page # Default JavaScript
{ :text=>'NavPage("http://"+ location_hostname_for_ipv6(location.hostname) +":"+ qweb_port +"/", 0);' },

# Login page # Default logo HTML
{ :text=>'<a href="http://www.qnap.com"><img src="/ajax_obj/images/qnap_logo_w.gif" alt="QNAP Turbo NAS" title="QNAP Turbo NAS"' },

# QNAP NAS # Not TS Series # Default table HTML
{ :text=>'<table width="100%" border="0" background="/v3_menu/images/admin_header.jpg" cellpadding="0" cellspacing="0" class="12-blue">', :model=>"Uknown (not TS Series)" },

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

	# Check document is QNAP XML
	if @body =~ /<QDocRoot version="[\d\.]+">/

		# Get firmware version and build
		if @body =~ /<version><!\[CDATA\[([^\]]+)\]\]><\/version>/ and @body =~ /<build><!\[CDATA\[([^\]]+)\]\]><\/build>/
			firmware=@body.scan(/<version><!\[CDATA\[([^\]]+)\]\]><\/version>/)[0][0]+" build "+@body.scan(/<build><!\[CDATA\[([^\]]+)\]\]><\/build>/)[0][0]
			m << { :firmware=>firmware }
		end	

		# Get model
		if @body =~ /<internalModelName><!\[CDATA\[([^\]]+)\]\]><\/internalModelName>/
			model=@body.scan(/<internalModelName><!\[CDATA\[([^\]]+)\]\]><\/internalModelName>/)[0][0]
			m << { :model=>model }
		end

		# Get enabled modules
		if @body =~ /<webFSEnabled><!\[CDATA\[1\]\]><\/webFSEnabled>/ then m << { :module=>"WebFS" } end
		if @body =~ /<QMultimediaEnabled><!\[CDATA\[1\]\]><\/QMultimediaEnabled>/ then m << { :module=>"Multimedia Station" } end
		if @body =~ /<MSV2Supported><!\[CDATA\[1\]\]><\/MSV2Supported>/ then m << { :module=>"MSV2" } end
		if @body =~ /<MSV2WebEnabled><!\[CDATA\[1\]\]><\/MSV2WebEnabled>/ then m << { :module=>"MSV2 Web" } end
		if @body =~ /<QDownloadEnabled><!\[CDATA\[1\]\]><\/QDownloadEnabled>/ then m << { :module=>"Download Station" } end
		if @body =~ /<QWebEnabled><!\[CDATA\[1\]\]><\/QWebEnabled>/ then m << { :module=>"QWeb Server" } end
		if @body =~ /<QWebSSLEnabled><!\[CDATA\[1\]\]><\/QWebSSLEnabled>/ then m << { :module=>"Qweb Server SSL" } end
		if @body =~ /<NVREnabled><!\[CDATA\[1\]\]><\/NVREnabled>/ then m << { :module=>"NVR" } end
		if @body =~ /<WFM2><!\[CDATA\[1\]\]><\/WFM2>/ then m << { :module=>"Web File Manager 2" } end

	end

	m

end

# Aggressive #
def aggressive
	m=[]

	# Extract details from /cgi-bin/authLogin.cgi (in XML format)
	target = URI.join(@base_uri.to_s,"/cgi-bin/authLogin.cgi").to_s
	status,url,ip,body,headers=open_target(target)

	# Check document is QNAP XML
	if body =~ /<QDocRoot version="[\d\.]+">/

		# Get firmware version and build
		if body =~ /<version><!\[CDATA\[([^\]]+)\]\]><\/version>/ and body =~ /<build><!\[CDATA\[([^\]]+)\]\]><\/build>/
			firmware=body.scan(/<version><!\[CDATA\[([^\]]+)\]\]><\/version>/)[0][0]+" build "+body.scan(/<build><!\[CDATA\[([^\]]+)\]\]><\/build>/)[0][0]
			m << { :firmware=>firmware }
		end

		# Get model
		if body =~ /<internalModelName><!\[CDATA\[([^\]]+)\]\]><\/internalModelName>/
			model=body.scan(/<internalModelName><!\[CDATA\[([^\]]+)\]\]><\/internalModelName>/)[0][0]
			m << { :model=>model }
		end

		# Get enabled modules
		if body =~ /<webFSEnabled><!\[CDATA\[1\]\]><\/webFSEnabled>/ then m << { :module=>"WebFS" } end
		if body =~ /<QMultimediaEnabled><!\[CDATA\[1\]\]><\/QMultimediaEnabled>/ then m << { :module=>"Multimedia Station" } end
		if body =~ /<MSV2Supported><!\[CDATA\[1\]\]><\/MSV2Supported>/ then m << { :module=>"MSV2" } end
		if body =~ /<MSV2WebEnabled><!\[CDATA\[1\]\]><\/MSV2WebEnabled>/ then m << { :module=>"MSV2 Web" } end
		if body =~ /<QDownloadEnabled><!\[CDATA\[1\]\]><\/QDownloadEnabled>/ then m << { :module=>"Download Station" } end
		if body =~ /<QWebEnabled><!\[CDATA\[1\]\]><\/QWebEnabled>/ then m << { :module=>"QWeb Server" } end
		if body =~ /<QWebSSLEnabled><!\[CDATA\[1\]\]><\/QWebSSLEnabled>/ then m << { :module=>"Qweb Server SSL" } end
		if body =~ /<NVREnabled><!\[CDATA\[1\]\]><\/NVREnabled>/ then m << { :module=>"NVR" } end
		if body =~ /<WFM2><!\[CDATA\[1\]\]><\/WFM2>/ then m << { :module=>"Web File Manager 2" } end

	end

	m

end

end

