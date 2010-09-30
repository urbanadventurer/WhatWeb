##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pixie" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-18
version "0.1"
description "pixie is a free, open source web application that will help you quickly create your own website - homepage: http://www.getpixie.co.uk/"

# 5 results for +"powered by pixie" -"Powered by Pixie Dust" +theme @ 2010-07-18
examples %w|
demo.getpixie.co.uk
www.marcjohnsdesign.com
pixie.axtry.com
www.indigoenergies.co.nz
www.rakyart.com
|

matches [

{ :regexp=>/[Powered by ]*<a [target="_blank"\ ]*href="http:\/\/www.getpixie.co.uk" title="Get Pixie">[Pixie\ Powered|Powered\ by\ Pixie|Pixie]+<\/a><\/li>/ },

]

def passive
        m=[]

        if @body =~ /	<meta name="generator" content="Pixie [\d\.]+ - Copyright \(C\) [\d]{4} - [\d]{4}." \/>/
                version=@body.scan(/	<meta name="generator" content="Pixie ([\d\.]+) - Copyright \(C\) [\d]{4} - [\d]{4}." \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

