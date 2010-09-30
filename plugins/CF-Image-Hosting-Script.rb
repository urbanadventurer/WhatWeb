##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "CF-Image-Hosting-Script" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.1"
description "A simple easy to use standalone image hosting script. This script aims to make it easy to setup image hosting site or just a site for you to share your photo with your friends,family,and collegues. - homepage: http://codefuture.co.uk/projects/imagehost/"

# 224 results for "powered by CF Image Hosting Script" @ 2010-09-17
examples %w|
hd365.tk
www.superdumpert.nl
www.chiccosite.de
matrixmersion.org/matriximage/
www.ressimupload.co.cc
www.image.spalner.com/admin.php
www.hostingfotek.pl
www.yfilehostco.co.uk
www.arpayeri.com/gg/
www.rapidonline.ro/gallery.php
sexymyspacebabes.com/image_hosting/
|

matches [

# Powered by text
{ :text=>'<p>Powered By <a href="http://codefuture.co.uk/projects/imagehost/" title="Free PHP Image Hosting Script">CF Image Hosting script</a>' },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /<p>Powered By <a href="http[s]*:\/\/codefuture.co.uk\/projects\/imagehost[\d\.]*[^>]+>CF Image Hosting script ([\d\.]+)<\/a>/
                version=@body.scan(/<p>Powered By <a href="http[s]*:\/\/codefuture.co.uk\/projects\/imagehost[\d\.]*[^>]+>CF Image Hosting script ([\d\.]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

