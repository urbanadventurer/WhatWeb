##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iGaming-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "iGaming CMS is a content management system designed for gaming websites. The system is written in PHP and requires a Mysql database for operation. "
website "http://www.igamingcms.com/"

# 24 results for "powered by iGaming CMS" @ 2010-09-12

# Dorks #
dorks [
'"powered by iGaming CMS"'
]



matches [

# HTML comment
{ :text=>'<!-- iGaming CMS is free software, please do not remove the copyright message. -->' },
{ :text=>'Powered by <a href="http://www.igamingcms.com/" target="_blank">iGaming CMS</a>' },

]

end

