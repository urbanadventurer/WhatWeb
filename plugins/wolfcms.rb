##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "WolfCMS" do
author "Andrew Horton"
version "1.0"
description "WolfCMS is an open-source content management system built with PHP."
website "https://www.wolfcms.org/"


matches [
{:version=>/png" \/> Wolf CMS ([^<]+)<\/div>/},
{:regexp=>/href="http:\/\/www.wolfcms.org\/" title="Wolf CMS" rel="noreferrer">Wolf CMS<\/a>[\s]+Inside./}
]

end
