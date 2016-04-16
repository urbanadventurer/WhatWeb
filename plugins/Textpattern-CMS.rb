##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Textpattern-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-13
version "0.1"
description "A flexible, elegant and easy-to-use CMS"
website "http://textpattern.com/"

# 34 results for "powered by Textpattern CMS" @ 2010-09-13


matches [

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/textpattern.com[\/]*">Textpattern CMS<\/a>/i },
{ :text=>'Powered by <a href="http://textpattern.com/" title="Textpattern, an Open Source Content Management System">Textpattern CMS</a>' },
{ :text=>"Powered by <a href='http://textpattern.com/' title='The Content Management System'>Textpattern CMS</a>" },
{ :text=>'Powered by <a href="http://textpattern.com/" title="Textpattern Open Source Content Management System">Textpattern CMS</a>' },
{ :text=>'Powered by <a href="http://textpattern.com/" title="A flexible, elegant and easy-to-use content management system.">Textpattern CMS</a>' },
{ :text=>'powered by <a href="http://textpattern.com">textpattern</a> cms' },

]

end

