##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

## Version 0.2
# added example sites

Plugin.define "Charset" do
author "Andrew Horton"
version "0.2"
description "Detects the character set of a page, this is required for MongoDB output. Only checks the meta content tag, not the HTTP header. It tries the specified charset, then ascii, then utf-8 then uses CharDet from the rchardet gem which is CPU intensive / slow. Tests conversion to UTF-8 using Iconv. Returns Failed if unsuccessful."


# requires rchardet
# https://github.com/jmhodges/rchardet
# http://www.meeho.net/blog/2010/03/ruby-how-to-detect-the-encoding-of-a-string/

def startup
	if not defined?(CharDet)
		error("ERROR: You need the rchardet gem to use the CharDet plugin to detect anything but ASCII or UTF-8.")
	end
end

def get_charset(body)
	charset=nil
	meta_content_tag=body.scan(/<meta[^>]+Content-Type[^>]+>/i)[0]
#	puts meta_content_tag
	unless meta_content_tag.nil? or not meta_content_tag =~ /charset=['"]?([a-zA-Z0-9_-]+)/i
		charset=meta_content_tag.scan(/charset=['"]?([a-zA-Z0-9_-]+)/i)[0][0]
		charset.upcase!
	end
	charset
end

def passive
	m=[]
	
	body=@body
=begin
		Arabic (Windows)	Windows-1256
		Baltic (Windows)	Windows-1257
		Central European (Windows)	Windows-1250
		Cyrillic (Windows)	Windows-1251
		Greek (Windows)	Windows-1253
		Hebrew (Windows)	Windows-1255
		Thai (Windows)	TIS-620
		Turkish (Windows)	Windows-1254
		Vietnamese (Windows)	Windows-1258
		Western European (Windows)	Windows-1252

		Arabic (ISO)	ISO-8859-6
		Baltic (ISO)	ISO-8859-4
		Central European (ISO)	ISO-8859-2
		Cyrillic (ISO)	ISO-8859-5
		Estonian (ISO)	ISO-8859-13
		Greek (ISO)	ISO-8859-7
		Hebrew (ISO-Logical)	ISO-8859-8-l
		Hebrew (ISO-Visual)	ISO-8859-8
		Latin 9 (ISO)	ISO-8859-15
		Turkish (ISO)	ISO-8859-9
		Western European (ISO)	ISO-8859-1

		Chinese Simplified (GB18030)	GB18030
		Chinese Simplified (GB2312)	GB2312
		Chinese Simplified (HZ)	HZ
		Chinese Traditional (Big5)	Big5
		Japanese (Shift-JIS)	Shift_JIS
		Japanese (EUC)	EUC-JP
		Korean	EUC-KR
		Unicode (UTF-8)	UTF-8
=end
		#UTF-7 ISO-8859-5 ISO-8859-1 ISO-2022-JP WINDOWS-1250 IBM852 EUC-JP SHIFT_JIS BIG5 UTF-8 ASCII


	trythese = %w| UTF_8 ASCII | # it's stack backwards

	charset=get_charset(body)
	trythese.push(charset) unless charset.nil?


	found=false
	while trythis = trythese.pop
	begin
        d = body.force_encoding('UTF-8')
		found=true
		m << {:string=> trythis}
		break
	rescue		
		#
	end

	if defined?(CharDet)
		if found==false
			begin
				cd = CharDet.detect(body)
				encoding = cd['encoding'].upcase
                d = body.force_encoding('UTF-8')
				found=true
				m << {:string=> encoding, :module=> "CharDet"}
			rescue
			end
		end
	end
		m << {:name=>"x",:string=> "Failed"} if found==false
	end

	m
end

end

