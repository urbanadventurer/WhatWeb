##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "dwr"
authors [
  "Aung Khant <http://yehg.net/>", # 2012-02-12
]
version "0.1"
description "Direct Web Remoting - http://directwebremoting.org"



# Matches #
matches [
{:name=>'HTML Body',:text=>'/dwr/engine.js\'>'},
{:name=>'HTML Body',:text=>'/dwr/engine.js">'}
]

end
