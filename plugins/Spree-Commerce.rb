##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Spree-Commerce" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-11-22
version "0.1"
description "Spree Commerce is an open source e-commerce solution - Homepage: http://spreecommerce.com/"

# Google results as at 2011-11-22 #
# 34 for inurl:"products?utf8=" inurl:keywords

# Dorks #
dorks [
'inurl:"products?utf8=" inurl:keywords'
]

# Examples #
examples %w|
demo.spreecommerce.com
www.lapalomerafarma.es/products?utf8=%E2%9C%93
farmawell.it/products?utf8=%E2%9C%93
unikicks.ru/products?utf8=%E2%9C%93
www.scale24.ru/products?utf8=%E2%9C%93
www.naturapet.com/products?utf8=%E2%9C%93
www.evopet.com/products?utf8=%E2%9C%93
www.innovapet.com/products?utf8=%E2%9C%93
|

# Matches #
matches [

# utf8 input box
{ :text=>'<div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>' },

]

end

