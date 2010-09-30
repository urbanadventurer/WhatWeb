##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Virtualmin" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-14 
version "0.1"
description "Virtualmin is a powerful and flexible web server control panel based on the well-known Open Source web-based systems management GUI, Webmin. - homepage: http://www.virtualmin.com/"
examples %w|
www.software.virtualmin.com
demo.virtualmin.com
https://admin.kocc.eu:12527
https://seattleserver.com:10000
https://azm.dk:10000
https://www.cre8ivewebsites.com:10000
https://riggli.tcnet.ch:10000
https://www.procob.cg:10000
https://secure.youngguns.nl:10000
https://izihost.biz:10000
https://webhosting.trustica.net:10000
https://steverowe.co.uk:1010
https://www.maxxdomain.de:10000
https://kaosenlared.net:10000
https://www.itchance.de:4711
https://da-vrt001.digital-adventures.nl:10000
https://eairvm01.edatactr.com:10000
https://www.gransassolagatrek.it:10000
https://www.randomlogic.net:10000
https://virtualmin.joyent.us/fbvolapu/
https://virtualmin.joyent.us/fbjicimu/
|
matches [

# 25 results @ 2010-06-14
{:name=>'GHDB: "Forgot your Virtualmin password?"',
:certainty=>75,
:ghdb=>'"Forgot your Virtualmin password?"'
},

# this text is the same for every language
{:name=>"virtualmin default text", 
:text=>'<center><a href=/virtualmin-password-recovery/>Forgot your Virtualmin password?</a></center>'
}

]

end

