##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpMoneyBooks" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-23
version "0.1"
description "phpMoneyBooks - Open Source Financial Software - Requires: PHP/MySQL"
website "http://phpmoneybooks.com/"

# Google results as at 2011-03-23 #
# 2 for "phpMoneyBooks" "Account ID" "password"

# Dorks #
dorks [
'"phpMoneyBooks" "Account ID" "password"'
]



# Matches #
matches [

# Login + Remember Me input
{ :text=>'<tr><td><center><input type="submit" name="B1" value="  Login  " class="button"></center></td><td><input type="checkbox" name="remember" value="1"> Remember Me</td></tr>' },

# Footer # Version Detection
{ :version=>/<b>phpMoneyBooks: ([^\s]+) - Star Host Design, LLC &copy 20[\d]{2} <\/b><\/div>/ },
{ :version=>/<b><a href='http:\/\/phpMoneyBooks\.com'>phpMoneyBooks<\/a>: ([^\s]+) - <a href='http:\/\/StarHostDesign\.com'>Star Host Design, LLC &copy<\/a> 20[\d]{2} <\/b><\/div>/ },

]

end

