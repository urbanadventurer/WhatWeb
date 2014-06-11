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

