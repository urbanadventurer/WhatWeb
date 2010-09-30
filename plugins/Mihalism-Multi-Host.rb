##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mihalism-Multi-Host" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "An easy image hosting solution for everyone. - homepage: http://www.mihalism.com/product/mmh/"

# 355 results for "powered by Mihalism Multi Host" @ 2010-08-28
# 78 results for "powered by Mihalism Multi Host" intitle:"MySQL Error (Powered by Mihalism Multi Host)" @ 2010-08-28
examples %w|
graphicshost.net
ph.crosscomp.eu
abunawaf.cwahi.net
megapic.ir
picpower.net
my-pix.org
img.nattawat.org
up2play.orgfree.com
up.mancity.ir
getgopix.com/multihost/
teamocx.org/uploadhinh/
picxcrazy.info
nahrejto.cz
upanhnhanh.co.cc/gallery.php
exxxposed.net/host/
images.meremmelek.net/gallery.php
ubloadimg.internet-caffe.net/install.php
shadykiller.er-webs.com/M.M.H.v4.0.2/install.php
www.imageupload2go.com/install.php
www.kaifkom.com/up/
www.uploadpixxx.com
www.imageurlhost.com
www.image-upload.net/gallery.php
www.web-biz-solutions.com/imagehost/
www.maxupload.net
www.dumppix.com
www.sinopcity.net/index.php
www.upni-obrazky.sk
www.thephade.com
www.anaqamaghribia.com/pic/
www.ilhapirata.org/imagehost/gallery.php
|

matches [

# Powered by text
{ :text=>'Powered by <a href="http://www.mihalism.com/product/mmh/">Mihalism Multi Host</a>' },

# Powered by HTML comment
{ :regexp=>/<!-- Powered by Mihalism Multi Host - Copyright \(c\) [\d\,\ ]+ Mihalism Technologies \(www.mihalism.net\) -->/ },
{ :regexp=>/<!-- Powered by Mihalism Multi Host - Copyright \(c\) [\d\,\ ]+ Mihalism, Inc. \(www.mihalism.com\) -->/ },

# Error page
{ :text=>'					<title>Fatal Error (Powered by Mihalism Multi Host)</title>' },
{ :text=>'					<title>MySQL Error (Powered by Mihalism Multi Host)</title>' },

# Install page
{ :text=>'    <title>Mihalism Multi Host » Installation</title>' },
{ :text=>'<b style="color: #F00;">Warning:</b> Using this installer will erase any already existing Mihalism Multi Host installation.' },

]

# Version detection using meta version
def passive
        m=[]

        if @body =~ /    <meta name="version" content="Mihalism Multi Host v([\d\.]+)" \/>/
                version=@body.scan(/    <meta name="version" content="Mihalism Multi Host v([\d\.]+)" \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

