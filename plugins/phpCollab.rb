##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpCollab" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-17
version "0.1"
description "phpCollab is an open source internet-enabled system for use in projects that require collaboration over the internet. - Homepage: http://www.php-collab.org/"

# Google results as at 2011-04-17 #
# 10 for "PhpCollab" inurl:/general/login.php

# Dorks #
dorks [
'"PhpCollab" inurl:/general/login.php'
]

# Examples #
examples %w|
mydemo.opensourcecms.com/phpcollab9992/general/login.php
www.santafemold.com/phpcollab/general/login.php
www.glasscreek.com/phpcollab/general/login.php
www.backswing-conseil.com/phpcollab/general/login.php
|

# Matches #
matches [

# Version Detection # HTML Comment
{ :version=>/^<!-- Powered by PhpCollab v([\d\.]+) \/\/-->$/ },

# Version Detection # footer text
{ :version=>/^<p id="footer">PhpCollab v([\d\.]+)[\s]*<\/p>$/ },

]

end


