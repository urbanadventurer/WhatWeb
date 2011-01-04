##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EscenicEngine5" do
author "nk@dsigned.gr"

version "0.1"
description "Identifies Escenic Engine CMS v5.x. Homepage: http://www.vizrt.com/products/escenic_content_engine/"
examples %w| thetimes.co.uk |

matches [
{:name=>"Contains Escenic Engine image urls", :regexp=>/.*(\.ece).*(ALTERNATES|BINARY).*(w\d+)/,:certainty=>85 },
{:name=>"Contains default .ece urls", :regexp=>/.*href=.*(\.ece).*/,:certainty=>75 },
]

end

