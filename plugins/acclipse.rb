##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Acclipse" do
author "Andrew Horton"
version "0.2"
description "Acclipse is a web CMS found mainly in New Zealand and Australia. It is popular with accountants. Websites: www.acclipse.co.nz & www.acclipse.com.au"

examples %w|
http://aguzzogroup.com.au/
http://anniesnannies.co.nz/
http://artstyle.co.nz/
http://barkers.co.nz/
http://bbtpartners.com.au/
http://www.bentleys.com.au/
http://bikehq.co.nz/
http://billingsellis.com.au/
http://blissaccountants.com.au/
http://bmca.co.nz/
http://btp.co.nz/
http://bwraccountants.com.au/
http://cbr.net.nz/
http://cbxjapan.com/
http://ckmmortgages.com.au/
http://clearyhoare.com.au/
http://cmacc.com.au/
http://davisford.com.au/
http://electromold.com.au/
http://foodshow.co.nz/
http://gillespiegroup.com.au/
http://glynmorrisandco.com.au/
http://gmaccounting.com.au/
http://gtcfin.com.au/
http://harakekeflowers.co.nz/
http://hat.com.au/
http://hoc.com.au/
http://hphanna.co.nz/
http://jacksonandjackson.co.nz/
http://marriotts.co.nz/
http://moamagrammar.nsw.edu.au/
http://momentumfg.com.au/
http://mortgagebrokermelbourne.net.au/
http://muscilloromano.com.au/
http://musclepeople.co.nz/
http://nelsontriclub.co.nz/
http://perricootamarinahouseboats.com.au/
http://pikopiko.co.nz/
http://projected-images.co.nz/
http://prtonline.com.au/
http://robinmajor.co.nz/
http://sabirk.com.au/
http://sbs.net.au/
http://scc.net.au/
http://sfrito.org.nz/
http://smefinancial.co.nz/
http://southerncrossadvisers.com.au/
http://southerndc3.co.nz/
http://statusrecruitment.co.nz/
http://storage2u.co.nz/
http://undergroundcoffee.co.nz/
http://valmadreaccountants.com.au/
http://whitetiecatering.co.nz/|

matches [
{:name=>"Footer link",
:regexp=>/<a href="http:\/\/www.(acclipse|acclipseweb).(co.nz|com.au)[\/]?(for_Businesses)?" target="_blank"( class="poweredbylink")?>(Software solutions for accountants|Web design New Zealand|Web design Australia)<\/a>/},

{:name=>"Website powered by",
:text=>"Website powered by <A href=\"http://www.acclipse.com.au\" target=_blank>Acclipse</A>"},

{:name=>"acclipse link with uppercase A href",
:text=>"<A href=\"http://www.acclipse.co.nz/\" target=_blank></A>"},

{:name=>"https://secure.acclipse.com link",
:regexp=>/https:\/\/secure.acclipse(web)?.com\/[^\/]*\/index.cfm/}
]


#
# <a href="http://www.acclipse.co.nz/" target="_blank">Software solutions for accountants</a>
# <a href="http://www.acclipse.co.nz" target="_blank" class="poweredbylink">Software solutions for accountants</a>
# <a href="http://www.acclipseweb.co.nz" target="_blank" class="poweredbylink">Web design New Zealand</a>
# <A href="http://www.acclipse.co.nz/" target=_blank></A>
# <a href="http://www.acclipseweb.co.nz" target="_blank" class="poweredbylink">Web design Australia</a>
# <a href="http://www.acclipse.co.nz/for_Businesses" target="_blank">Web design New Zealand</a> 
# <a href="http://www.acclipse.com.au/" target="_blank">Web design Australia</a>
# Website powered by <A href="http://www.acclipse.com.au" target=_blank>Acclipse</A>

#  <a href="https://secure.acclipse.com/hphanna.co.nz/index.cfm/Client_Login.html
# <a href="https://secure.acclipseweb.com/btp.co.nz/index.cfm/Client_Login.html
# url=https://secure.acclipseweb.com/barkers.co.nz/index.cfm/PRODUCTS
#
# can't detect testsites: bentleys.com.au, jacksonandjackson.co.nz, glynmorrisandco.com.au
# 
# ways to be sure -- license key in milonic_src.js, maybe some path


end

