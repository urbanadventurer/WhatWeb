##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Web-Publishing-Wizard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-22
version "0.1"
description "If your Internet service provider (ISP) provides space for publishing personal Web pages, you can use Web Publishing Wizard (WPW) to post your personal Web pages. Normally, you must first manually configure WPW before posting your pages. To prevent you from having to manually configure WPW, ISPs can place a file named Postinfo.html in the root folder of Web servers. This file contains all the server-specific information that you would normally have to enter. The file makes posting Web pages faster and easier. - More Info: http://support.microsoft.com/kb/163838"

# 13 results for intitle:"Web Posting Information" "The HTML comments in this page contain the configurationinformation" @ 2010-10-22
# 120 results for "The HTML comments in this page contain the configurationinformation" @ 2010-10-22
# 50 results for inurl:.gov intitle:"Index of" +description +size +postinfo.html @ 2010-10-22
examples %w|
sivaninhouse.co.il/postinfo.html
yshop.co.il/postinfo.html
www.oldgames.co.il/postinfo.html
www.shmuelhendler.co.il/postinfo.html
www.imlaw.co.il/postinfo.html
tmplus.co.il/postinfo.html
opop.co.il/postinfo.html
www.omer-media.co.il/postinfo.html
www.oyoon.ps/postinfo.html
www.alaqsa.ps/postinfo.html
yaservoice.ps/postinfo.html
live.qudsradio.ps/postinfo.html
ele22.mge.gov.sa/postinfo.html
ele98.mge.gov.sa/postinfo.html
pri17.mge.gov.sa/postinfo.html
pri68.mge.gov.sa/postinfo.html
www.lakejacksontx.gov/postinfo.html
www.ibadannortheast.gov.ng/postinfo.html
www.saosimao.go.gov.br/documentos/postinfo.html
www-cdf.fnal.gov/upgrades/controls/postinfo.html
wewoka.okgeosurvey1.gov/www/postinfo.html
www.ae.gov.sa/postinfo.html
www.ibarapacentral.gov.ng/postinfo.html
www.ibarapaeast.gov.ng/postinfo.html
www.iseyin.gov.ng/postinfo.html
www.ibarapanorth.gov.ng/postinfo.html
www.ibadansouthwest.gov.ng/postinfo.html
www.irepo.gov.ng/postinfo.html
www.ibadansoutheast.gov.ng/postinfo.html
www.ibadannorthwest.gov.ng/postinfo.html
www.oluyole.gov.ng/postinfo.html
www.oyostateirs.gov.ng/postinfo.html
www.ogooluwa.gov.ng/postinfo.html
www.ogbomososouth.gov.ng/postinfo.html
www.sakieast.gov.ng/postinfo.html
www.oyowest.gov.ng/postinfo.html
www.ogbomosonorth.gov.ng/postinfo.html
www.afijio.gov.ng/postinfo.html
www.onaara.gov.ng/postinfo.html
www.atiba.gov.ng/postinfo.html
www.akinyele.gov.ng/postinfo.html
www.olorunsogo.gov.ng/postinfo.html
www.oyoeast.gov.ng/postinfo.html
www.itesiwaju.gov.ng/postinfo.html
www.oorelope.gov.ng/postinfo.html
www.iwajowa.gov.ng/postinfo.html
www.laesperanza.gov.ec/postinfo.html
www.egbeda.gov.ng/postinfo.html
www.bayraklihem.gov.tr/postinfo.html
www.surulere.gov.ng/postinfo.html
www.sakiwest.gov.ng/postinfo.html
www.oyostatelegislature.gov.ng/postinfo.html
www.kajola.gov.ng/postinfo.html
www.lagelu.gov.ng/postinfo.html
www.ibadannorth.gov.ng/postinfo.html
www.ido.gov.ng/postinfo.html
|

# Extract details
def passive
	m=[]

	if @body =~ /<TITLE> WEB POSTING INFORMATION <\/TITLE>/i

		# Version
		if @body =~ /^<!-- postinfo.html version ([\d\.]+)>/i
			version=@body.scan(/^<!-- postinfo.html version ([\d\.]+)>/i)
			m << { :version=>version }
		end

		# Binaries
		if @body =~ /[\s]*FPShtmlScriptUrl="([^\"]+)"/i
			accounts=@body.scan(/[\s]*FtpServerName="([^\"]+)"/i)
			m << { :account=>accounts }
		end
		if @body =~ /[\s]*FPAuthorScriptUrl="([^\"]+)"/i
			accounts=@body.scan(/[\s]*FPAuthorScriptUrl="([^\"]+)"/i)
			m << { :account=>accounts }
		end
		if @body =~ /[\s]*FPAdminScriptUrl="([^\"]+)"/i
			accounts=@body.scan(/[\s]*FPAdminScriptUrl="([^\"]+)"/i)
			m << { :account=>accounts }
		end

		# XferType
		if @body =~ /[\s]*XferType="([^\"]+)"/i
			 modules=@body.scan(/[\s]*XferType="([^\"]+)"/i)
			m << { :module=>modules }
		end

		# FTP
		if @body =~ /[\s]*FtpServerName="([^\"]+)"/i
			modules=@body.scan(/[\s]*FtpServerName="([^\"]+)"/i)
			m << { :module=>modules }
		end

	end

	m

end

end

