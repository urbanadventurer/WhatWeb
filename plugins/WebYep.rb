##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebYep" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-03
version "0.1"
description "WebYep is a compact Web Content Management System, making editable Websites extremely easy to create and maintain. Different to bigger WebCMS tools, WebYep offers a low priced alternative for small Websites. Requires: PHP"
website "http://www.obdev.at/products/webyep/index.html"

# Google results as at 2011-03-03 #
# 36 for intitle:"WebYep Logon"



# Matches #
matches [

# webyep-logon-en.php # Warning text
{ :text=>'<p class="warning">To edit these pages with WebYep you need to <strong>enable JavaScript</strong> in your Web' },

# Default HTML Comment
{ :text=>'<html><!-- InstanceBegin template="/Templates/panels.dwt.php" codeOutsideHTMLIsLocked="false" -->' },

]

end


