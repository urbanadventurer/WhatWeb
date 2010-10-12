##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LINK-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.1"
description "LINK-CMS: PHP based CMS - homepage: http://www.link-softsolutions.com/SoftLink-Content-Management-System---CMS_20_1"

# 50 results for "Powered by LINK CMS" @ 2010-10-12
examples %w|
www.afc-loro.co.rs
www.biznis-akademija.com
www.edu-soft.rs
www.ekongim.edu.rs
www.ekongim.edu.rs/cms/preview/
www.fsom.edu.rs
www.it-akademija.com
www.its.edu.rs
www.link.co.rs/news/
www.mre.gov.rs/main.php
www.naxi.co.rs
www.planum.rs
www.poslovnaskola.com
www.simplex.ba
www.super-lab.com
www.videoseminari.com
|

matches [

# Powered by text
{ :text=>'<a href="http://www.link-softsolutions.com/SoftLink-Content-Management-System---CMS_20_1" target="_blank">LINK CMS</a>' },
{ :text=>'<a href="http://www.link-softsolutions.com/SoftLink-Content-Management-System---CMS_20_1">LINK CMS</a>' },

]

end

