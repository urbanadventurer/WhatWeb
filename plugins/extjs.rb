##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ExtJS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-15
version "0.1"
description "Ext JS is a cross-browser JavaScript library for building rich internet applications."
website "http://www.sencha.com/products/extjs/"



# Matches #
matches [

# JavaScript Source
{ :regexp=>/<script [^>]*src=["'][^>]*ext\-base\.js["']/i },

]

end


