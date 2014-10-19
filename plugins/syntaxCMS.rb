##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "syntaxCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.1"
description "SyntaxCMS simplifies publishing various types of content to a site, facilitates creating and managing arbitrary relationships among content items, automates and accelerates custom development, and encourages reuse of site components with other SyntaxCMS installations. It is built using PHP and MySQL and is licensed under the Common Public License. "
website "http://www.syntaxcms.org/"

# 19 results for "powered by syntaxCMS" @ 2010-08-15

# Dorks #
dorks [
'"powered by syntaxCMS"'
]



matches [

{ :text=>'Powered by <a href="http://www.syntaxcms.org">SyntaxCMS</a></div>' },
{ :text=>'powered by <a href="http://www.syntaxcms.org/" title="SyntaxCMS">SyntaxCMS</a></div>' },

]

end

