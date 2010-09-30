##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Basilic" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.1"
description "Basilic is a bibliography server for research laboratories. It automates and facilitates the diffusion of research publications over the internet, automatically generating web pages from a publication database. - homepage: http://artis.imag.fr/Software/Basilic"

# 14 results for "powered by basilic" @ 2010-08-14
examples %w|
www.lifl.fr/GRAPHIX/publications.php
secure.ntsg.umt.edu/publications/
www.liaad.up.pt/pub/
www.inis.iarc.uaf.edu/publications/
|

matches [

{ :text=>"Powered by <a href='http://artis.imag.fr/Software/Basilic/'>Basilic</a></p>" },
{ :text=>"<a href='http://artis.imag.fr/Software/Basilic'>Powered by Basilic</a></span>" },

]

# Version detection using powered by footer text
def passive
        m=[]

        if @body =~ /  <span>Powered by <a href='http:\/\/artis.imag.fr\/Software\/Basilic'>Basilic [\d\.]+<\/a><\/span>/
                version=@body.scan(/  <span>Powered by <a href='http:\/\/artis.imag.fr\/Software\/Basilic'>Basilic ([\d\.]+)<\/a><\/span>/)[0][0]
                m << {:version=>version}
        end

	if @body =~ /<a href='http:\/\/artis.imag.fr\/Software\/Basilic'[^>]+>&copy; Powered by Basilic [\d\.]+/
		version=@body.scan(/<a href='http:\/\/artis.imag.fr\/Software\/Basilic'[^>]+>&copy; Powered by Basilic ([\d\.]+)/)[0][0]
		m << {:version=>version}
	end

        m

end


end

