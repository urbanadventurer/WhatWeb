##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "c99-Shell" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-08
version "0.1"
description "c99 PHP Backdoor"

# 272 results for inurl:c99.php ext:php @ 2010-10-08
# 117 results for inurl:c99.php ext:php +uname @ 2010-10-08
examples %w|
attacker.securecrash.org/shellz/c99.php
freewebs.com/grove/c99.php
bennyblog.net/c99.php
iiisebaiii.altervista.org/public/r57/c99.php
freelancer-blackfare.tym.sk/c99.php
usuarios.multimania.es/charmedpower/pizarron_ima/c99.php
slavegod.3x.ro/try/upload_files/c99.php
0a.se/eshop/c99.php
www.malta-hotel.com/special/img/hotels/c99.php
|

matches [

# Form HTML # Identifies both c99 source and working c99 shells
{ :text=>'Dir: <input type="text" name="directory" method="get"> <input type="submit" value="List Directory"><br><br> eg: /etc/<br>' },
{ :text=>'<center>Php Safe-Mode Bypass (List Directories):     <form action="' },

]

# Get local file path
def passive
        m=[]

	# Check for value starting with "/" so as to skip c99 shell source code
        if @body =~ /<input type=hidden name=act value="cmd"><input type=hidden name="d" value="\//
		if @body =~ /<input type=hidden name=act value="cmd"><input type=hidden name="d" value="([^\"]+)/
                	version=@body.scan(/<input type=hidden name=act value="cmd"><input type=hidden name="d" value="([^\"]+)/)[0][0]
       			m << {:version=>version}
		end
        end

        m

end


end

