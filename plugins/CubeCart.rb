##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CubeCart" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-10
version "0.1"
description "CubeCart is an out of the box ecommerce shopping cart software solution which has been written to run on servers that have PHP & MySQL support. - homepage: http://www.cubecart.com/"

# 492 results for intitle:"powered by cubecart" @ 2010-09-10
# 643 results for "powered by cubecart" @ 2010-09-10
examples %w|
demo.cubecart.com/cc3/
americankaiju.kaijuphile.com/store/index.php
myjapantshirt.com
downloadfitnessmusic.com
prestonsbooks.com
sugarsugarbags.com/shop/index.php
www.bijouxandzoe.com
www.claudiasbaskets.com
www.node3-records.com/shop/
www.peninsulamotorhomes.com.au/shop/
www.thecdguyz.com
www.trustmagic.com.au/index.php
www.yanelis3d.net/store/
|

matches [

# Powered by text
{ :text=>"<div class='txtCopyright'>Powered by <a href='http://www.cubecart.com' class='txtCopyright' target='_blank'>CubeCart</a>" },

# Default title
{ :text=>' (Powered by CubeCart)</title>' },

]

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /  <p class="defaultText">Powered by CubeCart version ([\d\.]+)<br \/>/
                version=@body.scan(/  <p class="defaultText">Powered by CubeCart version ([\d\.]+)<br \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

