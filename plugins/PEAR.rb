##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PEAR" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-11-16
version "0.1"
description "PEAR - PHP Extension and Application Repository - PEAR is a framework and distribution system for reusable PHP components. - Homepage: http://pear.php.net/"

# Google results as at 2012-011-16 #
# 47 for intitle:"PEAR :: PEAR_Info" "auto_discover"

# Dorks #
dorks [
'intitle:"PEAR :: PEAR_Info" "auto_discover"'
]

# Examples #
examples %w|
webdev.felk.cvut.cz/info/pearinfo.php
www.imingo.net/pear/pear_info.php
pear.modwest.com
community.curtislibrary.com/CML/library/pear/docs/PEAR_Info/examples/pear_info.php
home.pl/files/pearinfo.php
202.65.133.69/xampp/pearinfo.php
forum.lolipop.jp/servinfo/pear.php
www.nono150.com/cgi/pear_info.php
www.apartment-in-tuebingen.de/xampp/pearinfo.php
www.pb-web.jp/systemtool/pear_info.php
stawn.uwcs.co.uk/info/pearinfo.php
|

# Matches #
matches [

# Detect Number of Installed Packages
{ :string=>/<h2><a id="top0">([\d]+ Installed Packages), Channel / },

# Module Detection
{ :module=>/<h2><a id="pkg_([^\s^\"]+)"><\/a><a/ },

# Title
{ :certainty=>75, :text=>'<title>PEAR :: PEAR_Info()</title>' },

# Filepath Detection
{ :filepath=>/<tr class="v">\s+<td class="e">www_dir<\/td>\s+<td>([^<]+)<\/td>\s+<\/tr>/ },

]

end

