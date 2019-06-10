##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Acclipse"
authors [
  "Andrew Horton",
  # Andrew Horton # v0.3 # 2019-07-10 # Added website field.
]
version "0.3"
description "Acclipse is a web CMS found mainly in New Zealand and Australia. It is popular with accountants."
website "www.acclipse.com"


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


end

