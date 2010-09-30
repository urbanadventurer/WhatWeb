##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "jobberBase" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.1"
description "jobberBase is the open-source job board software that helps you set up a jobsite in minutes! - homepage: http://www.jobberbase.com/"
examples %w|
www.jobberbase.com/demo/
jobs.murexusers.org
www.freelancer-media.com
www.talentxfactor.com/jobberbase/
www.jobs.ncdagroup.com/
recruiter-talk.com/jobberbase_1_5b1/app/
bestjobsalary.com
www.rabota.net
analyticster.com
www.itdarbas.lt
www.globaljobwatch.com
stylishjobs.com
poslovna-sinergija.com
www.uieee.com
jobs.copywritertemps.com
starjup.com
www.konek.us
www.bestjobsalary.com
jobs.ezthememarket.net
www.xpail.com
forum.bartendersco.com
makerjobs.com/job/
www.jobs.searchatradie.com.au
|

matches [

# About 116,000 results  @ 2010-60-06
{:name=>'GHDB: +Companies +Sitemap "Proudly powered by jobberBase"',
:certainty=>75,
:ghdb=>'+Companies +Sitemap "Proudly powered by jobberBase"'
},

{:name=>"meta author",
:certainty=>75,
:text=>'<meta name="author" content="http://www.jobberbase.com" />'
},

{:name=>"powered by text",
:regexp=>/Proudly powered by[\s]+<a href="http:\/\/www.jobberbase.com\/" title="open source job board software">jobberBase<\/a>/
},

{:name=>"powered by text",
:regexp=>/Proudly powered by[\s]+<a href="http:\/\/www.jobberbase.com\/" target="_blank" title="open source job board software">jobberBase<\/a>/
}

]

end

