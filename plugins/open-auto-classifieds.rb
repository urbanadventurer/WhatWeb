##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Open-Auto-Classifieds" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-27
version "0.1"
description "OAC is a free, open source vehicle classifieds manager. Intended to be easy to install and easy to administer, Open Auto Classifieds is based on open technologies such as the PHP scripting language, the MySQL database engine, XHTML eXtensible Hypertext Markup Language, and CSS Cascading Style Sheet styling. - homepage: http://www.openautoclassifieds.com/index.php"

# 221 results for "powered by Open Auto Classifieds" @ 2010-08-27
examples %w|
openautoclassifieds.com
bavautogroup.com
gaidaoautomoveis.com
giaoto.com
newchamanmotors.com
ogm.bz
schrott-platz.com
search-used-cars.net
thetradepolice.com/openauto/
yourcars.net
youngsauto.net/listings.php
zbaron.org/autoclass/
www.motorex.co.za
www.vipcarsinc.com
www.pinoyautomart.com
www.delhiautomobile.com
|

matches [

# Powered by text
{ :text=>'<p>Powered by <a href="http://www.openautoclassifieds.com/index.php">Open Auto Classifieds</a>' },

]

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /			<p>Powered by <a href="http:\/\/www.openautoclassifieds.com[\/]*[index.php]*">Open Auto Classifieds v([\d\.a-z]+)/
                version=@body.scan(/			<p>Powered by <a href="http:\/\/www.openautoclassifieds.com[\/]*[index.php]*">Open Auto Classifieds v([\d\.a-z]+)/)[0][0]
                m << {:version=>version}
        end

	if @body =~ /			<p>Powered by Open Auto Classifieds v([\d\.a-z]+)/
		version=@body.scan(/			<p>Powered by Open Auto Classifieds v([\d\.a-z]+)/)[0][0]
		m << {:version=>version}
	end

	m

end


end

