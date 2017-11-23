##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define do
name "ASPForum"
author "Mateusz Golewski"
version "0.1"
description "Kind of ASP forum."
examples %w|http://forums.vetteweb.com/|

matches [

{:version=>/<div[^>]+id="FORUMS_FORUM_GROUP_V([\d_]+)/,  :name=>"version" },

]

end
