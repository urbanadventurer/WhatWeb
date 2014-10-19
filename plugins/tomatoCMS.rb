##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TomatoCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.1"
description "TomatoCMS considers each web page made up of many different elements called widgets. You can easily create, customize the layout of your site like never before through a visual tool called Layout Editor very easy and convenient."
website "http://www.tomatocms.com/"

# Dorks #
dorks [
'"powered by TomatoCMS"'
]



matches [

# 9 results for "powered by TomatoCMS" @ 2010-07-10
{:text=>'<a href="http://www.tomatocms.com" title="Powered by TomatoCMS" target="_blank">' },

{:text=>"	Tomato.Core.Widget.Loader.baseUrl = 'http://" },

{:text=>'					<h1>TomatoCMS Install Wizard</h1>', :version=>"Install Page" },

]

end

