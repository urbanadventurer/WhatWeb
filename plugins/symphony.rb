##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Symphony" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "XSLT-powered open source content management system - homepage: http://symphony-cms.com/"

# 115 results for "powered by Symphony" @ 2010-09-12
examples %w|
aramdavid.com
carsonsasser.com
sonocs.com
teoballve.com
www.abacentre.ca
www.group-gs.com
www.juliatabor.com
www.truthmove.org
www.truthmove.org/symphony/
|

matches [

# Admin page
{ :text=>'	<title>Symphony | Login</title>' },

# Powered by text
{ :text=>'powered by <a href="http://www.symphony21.com">SYMPHONY</a>.' },
{ :text=>'Powered by <a href="http://symphony21.com/">Symphony</a>' },
{ :text=>'Powered by <a class="symphony" href="http://symphony21.com/">Symphony</a>' },
{ :text=>'Powered by <a class="symphony" href="http://symphony-cms.com/">Symphony</a>' },
{ :text=>'<div class="powered">Powered by <a class="symphony" href="http://symphony-cms.com/">Symphony CMS</a></div>' },
{ :text=>'Site powered by <a href="http://www.symphony-cms.com" class="external">Symphony</a>' },
{ :text=>'Powered by <a href="http://symphony-cms.com/" rel="external">Symphony</a>' },

]

end

