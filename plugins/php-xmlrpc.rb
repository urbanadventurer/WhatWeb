##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-XMLRPC" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-17
version "0.1"
description "XML-RPC for PHP is a library implementing the XML-RPC protocol, written in PHP. It is also known as PHPXMLRPC."
website "http://phpxmlrpc.sourceforge.net/"

# Google results as at 2011-05-17 #
# 8 for "Generated using PHP-XMLRPC" ext:php

# Dorks #
dorks [
'"Generated using PHP-XMLRPC" ext:php'
]



# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="generator" content="XML-RPC for PHP" />' },

# Version Detection # Generated footer
{ :version=>/<div class="footer">Generated using PHP-XMLRPC ([\d\.]+)<\/div>/ },

]

end


