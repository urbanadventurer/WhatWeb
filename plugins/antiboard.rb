##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Updated description
##
Plugin.define "Antiboard" do
author "Andrew Horton"
version "0.2"
description "Antiboard is a PHP forum. Homepage used to be http://www.resynthesize.com/code/antiboard.php."

# Dorks #
dorks [
'inurl: antiboard.php'
]

# inurl: antiboard.php
#  <form method="post" action="/antiboard/antiboard.php">
# <a href="http://www.resynthesize.com/code/antiboard.php">Powered by antiboard 0.7.2</a>

# Matches #
matches [
{:name=>"inurl", :ghdb=>"inurl:antiboard.php" },
{:name=>"powered by", :text=>"<a href=\"http://www.resynthesize.com/code/antiboard.php\">Powered by antiboard" }
]

end

