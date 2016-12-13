##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BackBee" do
author "Guillaume Delacour <gui@iroqwa.org>" # 2016-04-22
version "0.1"
description "BackBee is an open source Content Management System (CMS)"

# Matches #
matches [
{ :certainty=>100, :text=>'<div id="bb5-site-wrapper">' },
]

end
