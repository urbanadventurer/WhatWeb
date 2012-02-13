##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "dwr" do
author "Aung Khant <http://yehg.net/>" # 2012-02-12
version "0.1"
description "Direct Web Remoting - http://directwebremoting.org"

# Examples #
examples %w|
http://directwebremoting.org/dwr-demo/dwr/test/JavascriptChat
http://directwebremoting.org/dwr-demo/widgets/dojo-demo.html
|

# Matches #
matches [
{:name=>'HTML Body',:text=>'/dwr/engine.js\'>'},
{:name=>'HTML Body',:text=>'/dwr/engine.js">'}
]

end
