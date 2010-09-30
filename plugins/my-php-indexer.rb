##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "My-PHP-Indexer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.1"
description "PHP file indexer - homepage: http://www.mafiatic.com"

# 34 results for "powered by My PHP Indexer" @ 2010-08-01
examples %w|
www.amevasc.org/diplomas/
manuals.aonly.com
www.b-tasarim.com/dersler/
dev.nticafrica.org
deafboy.cicolina.org/fileman/
w2.dtps.tp.edu.tw/resources/
munjiza.com/edukacije/
www.pa1kh.nl/cmsimple/downloads/
gallery.bramandityo.com
|

def passive
        m=[]

        if @body =~ /<!--Copyright--><a target="_blank" class="l" href="http:\/\/www.mafiatic.com">Powered by My PHP Indexer [\d\.]+ \| Copyright &copy; [0-9]{4}\-[0-9]{4} Mafiatic Inc.<\/a><!--Copyright-->/
                version=@body.scan(/<!--Copyright--><a target="_blank" class="l" href="http:\/\/www.mafiatic.com">Powered by My PHP Indexer ([\d\.]+) \| Copyright &copy; [0-9]{4}\-[0-9]{4} Mafiatic Inc.<\/a><!--Copyright-->/)[0][0]
                m << {:version=>version}
        end

        m

end


end

