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



matches [
{:name=>"Footer link",
:regexp=>/<a href="http:\/\/www\.(acclipse|acclipseweb)\.(co\.nz|com\.au)[\/]?(for_Businesses)?" target="_blank"( class="poweredbylink")?>(Software solutions for accountants|Web design New Zealand|Web design Australia)<\/a>/},

{:name=>"Website powered by",
:text=>"Website powered by <A href=\"http://www.acclipse.com.au\" target=_blank>Acclipse</A>"},

{:name=>"acclipse link with uppercase A href",
:text=>"<A href=\"http://www.acclipse.co.nz/\" target=_blank></A>"},

{:name=>"https://secure.acclipse.com link",
:regexp=>/https:\/\/secure\.acclipse(web)?\.com\/[^\/]*\/index\.cfm/}
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

