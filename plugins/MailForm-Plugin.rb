##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MailForm-Plugin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "PHP contact form - homepage: http://www.h-fj.com/blog/mtplgdoc/"

# 24 results for "powered by MailForm" @ 2010-09-18
examples %w|
www.mt-j.info/contact.html
ono-eye.jpmd.org/mailform.html
soramame.com.au/en/mail-form.php
yurakucho-cpa.jp/yurakucho_cpa_office/mailform.html
www.another-here-i-am.com/mailform.php
www.clover8.com/mailform.html
www.jatts.jp/admissionform.html
|

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /<a href="http:\/\/www.h-fj.com\/blog\/mtplgdoc\/mailformv[\d\.\_]+.php"[^>]*>Powered by Mailform[\ plugin]*[s]* V([\d\.]+)<\/a>/i
                version=@body.scan(/<a href="http:\/\/www.h-fj.com\/blog\/mtplgdoc\/mailformv[\d\.\_]+.php"[^>]*>Powered by Mailform[\ plugin]*[s]* V([\d\.]+)<\/a>/i).to_s
                m << {:version=>version}
        end

        m

end


end

