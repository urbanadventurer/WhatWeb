##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Whizzy-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "CMS - homepage: http://unverse.net/"

# 37 results for "powered by Whizzy CMS" @ 2010-09-18
examples %w|
bruehler.net
hardmanhydroponics.com
planweboffice.com
premierbchina.com
unverse.net
websitesmade.co.uk
www.jorogo.co.uk
www.royalberks.info
www.sixbellsconcrete.co.uk
www.ubi-sunt.com
www.woodleytheatre.org
|

# Passive version detection
def passive
        m=[]

	# HTML comment
        if @body =~ /Powered by Whizzy CMS <big>&spades;<\/big> <\/a><\/div><!-- \[Whizzy CMS:Whizzy CMS ([^\]]+)/
                version=@body.scan(/Powered by Whizzy CMS <big>&spades;<\/big> <\/a><\/div><!-- \[Whizzy CMS:Whizzy CMS ([^\]]+)/)[0][0]
                m << {:version=>version}
        end

        m

end


end

