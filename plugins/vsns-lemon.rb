##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 & :name
# Version 0.3
# Uses :version=>//

Plugin.define "VSNSLemon" do
author "Andrew Horton"
version "0.3"
description "VSNS is a Very Simple News System written in PHP. VSNS Lemon vulnerabilities: http://evuln.com/vulns/106/summary.html"
examples %w|http://tachyondecay.net/blog/ www.mollysgusher.net/blog http://www.borregofam.com/blog http://papeh.net/blog/archives/Code/ |

# from version 4 at tachyondecay.net
#<img src="/images/vsns_lemon_80x15.png" alt="VSNS Lemon" title="Blog powered by VSNS Lemon" width="80" height="15">
#<a href="/scripts/vsns_lemon" title="Blog powered by VSNS Lemon"><img src="/images/vsns_lemon_80x15.png" alt="VSNS Lemon" width="80" height="15"></a>

# <div id="vsns-container">
# <div id="vsns-inner">
# <div class="news_container" id="vsns2527">


matches [
# http://johnny.ihackstuff.com/ghdb?function=detail&id=1840
{:ghdb=>'"Powered by Vsns Lemon" intitle:"Vsns Lemon"'},
{:ghdb=>'<p>Powered by <abbr title="very simple news system">'},
{:name=>"powered by link",
:regexp=>/<p>Powered by <abbr title="very simple news system">VSNS<\/abbr> Lemon [0-9.a-z]* by <a href="http:\/\/tachyondecay.net\/">Tachyon<\/a>/},

{:regexp=>/<a[^>]*title="Blog powered by VSNS Lemon">/},

{:certainty=>50, :regexp=>/<div id="(vsns-inner|vsns-container|vsns-inner)">/},

{:regexp=>/<img[^>]*alt="VSNS Lemon"[^>]*title="Blog powered by VSNS Lemon"[^>]*>/},

{:version=>/<p>Powered by <abbr title="very simple news system">VSNS<\/abbr> (Lemon) ([0-9.a-z]*) by <a href="http:\/\/tachyondecay.net\/">Tachyon<\/a>/, :version_regexp_offset=>1,  :name=>"powered by link" }
]


end

