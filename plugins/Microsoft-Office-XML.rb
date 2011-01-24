##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated regex
##
Plugin.define "Microsoft-Office-XML" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.2"
description "This module detects instances of Microsoft Office documents saved as HTML and attempts to extract the user name, company name and office version. - homepage: http://en.wikipedia.org/wiki/Microsoft_Office_XML_formats"

# About 123,000 results for <o:DocumentProperties> <o:Template> @ 2010-10-14
examples %w|
download.microsoft.com/documents/australia/education/teacher_tools/lessonplans/10_things_I_hate_about_Shakespeare/10_things_I_hate_about_Shakespeare.htm
members.multimania.nl/atelierrudselmartin/index.html
philip.inpa.gov.br/publ_livres/Preprints/2001/SOIL-LES.mht
two.xthost.info/odinms/
www.a-snippet-of-history.com/firstwomansrightsmovement.mht
www.ajfand.net/Issue-XII-files/Brand%20Hypocrisy%20at%20Starbucks.mht
www.hispanicvillage.com/cabaretpeople/AircraftParts1a.hta
www.immunostim.com.au/downloads/CustLoyalty.mht
www.immunostim.com.au/downloads/ImmuneSystem.mht
www.m-a-t-a.org/PPoint/VBrick-MATA.mht
www.masaadvertising.de/shop/
www.naturalclinicaltrials.com/Natural%20Clinical%20Trials%20mweb.mht
www.newvisiontn.org/Modified_News_letter.mht
www.p12.nysed.gov/specialed/nyssb/nimas/NIMAS_for_TVIs.mht
www.raymondchamber.com
www.staklofoundation.com/torts/Torts-Oct-3.mht
www.kyzmet.kz/usersfiles/3476.05.2010.xml
www.unicusdata.com/download/DefaultTemplate.docx.AmpTemplate
|

# Extract version, usernames and company
def passive
	m=[]

	# Excel
	if @body =~ /<DocumentProperties xmlns="urn:schemas-microsoft-com:office:[excel|office]?">/ or @body =~ /<?mso-application progid="Excel.Sheet"?>/

		# Get version
		if @body =~ /<Version>([^<]+)<\/Version>/
			version=@body.scan(/<Version>([^<]+)<\/Version>/)
			m << {:version=>"Excel "+version}
		end

		# Get company
		if @body =~ /<Company>([^<]+)<\/Company>/
			accounts=@body.scan(/<Company>([^<]+)<\/Company>/)[0][0]
			m << {:account=>"Company:"+accounts}
		end

		# Get usernames
		if @body =~ /<Author>([^<]+)<\/Author>/
			accounts=@body.scan(/<Author>([^<]+)<\/Author>/)[0][0]
			m << {:account=>accounts}
		end

		if @body =~ /<LastAuthor>([^<]+)<\/LastAuthor>/
			accounts=@body.scan(/<LastAuthor>([^<]+)<\/LastAuthor>/)[0][0]
			m << {:account=>accounts}
		end

	end

	# Word
	if @body =~ /<o:DocumentProperties>/ or @body =~ /<?mso-application progid="Word.Document"?>/

		# Get version
		if @body =~ /<o:Version>([^<]+)<\/o:Version>/
			version=@body.scan(/<o:Version>([^<]+)<\/o:Version>/)[0][0]
			m << {:version=>"Word "+version}
		end

		# Get company
		if @body =~ /<o:Company>([^<]+)<\/o:Company>/
			accounts=@body.scan(/<o:Company>([^<]+)<\/o:Company>/)[0][0]
			m << {:account=>"Company:"+accounts}
		end

		# Get usernames
		if @body =~ /<o:Author>([^<]+)<\/o:Author>/
			accounts=@body.scan(/<o:Author>([^<]+)<\/o:Author>/)[0][0]
			m << {:account=>accounts}
		end

		if @body =~ /<o:LastAuthor>([^<]+)<\/o:LastAuthor>/
			accounts=@body.scan(/<o:LastAuthor>([^<]+)<\/o:LastAuthor>/)[0][0]
			m << {:account=>accounts}
		end

	end

	# Core document properties
	if @body =~ /<cp:coreProperties/

		# Get usernames
		if @body =~ /<dc:creator>([^<]+)<\/creator>/
			accounts=@body.scan(/<dc:creator>([^<]+)<\/creator>/)[0][0]
			m << {:account=>accounts}
		end

		if @body =~ /<dc:lastModifiedBy>([^<]+)<\/creator>/
			accounts=@body.scan(/<dc:lastModifiedBy>([^<]+)<\/creator>/)[0][0]
			m << {:account=>accounts}
		end

		# Get company
		if @body =~ /<Company>([^<]+)<\/Company>/
			accounts=@body.scan(/<Company>([^<]+)<\/Company>/)[0][0]
			m << {:account=>"Company:"+accounts}
		end

		# Get version
		if @body =~ /<AppVersion>([^<]+)<\/AppVersion>/
			version=@body.scan(/<AppVersion>([^<]+)<\/AppVersion>/)[0][0]
			m << {:version=>version}
		end

	end

	m

end

end

