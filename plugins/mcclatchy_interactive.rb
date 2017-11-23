##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define do
name "McClatchy-Interactive"
author "Shuai Lin"
version "0.1"
description "McClatchy-Interactive is a news website engine."

examples %w|
http://www.adn.com/
http://www.kentucky.com/
http://www.sacbee.com/
|

matches [

{ :regexp=> %r{<script type="text/javascript" src="http://media.\w+.com/mistats/mianalytics.js"></script>} },

{ :text=> 'miAppControler contains master settings that can be used to quickly disable' }

]

end
