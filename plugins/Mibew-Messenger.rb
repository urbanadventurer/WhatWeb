##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Mibew-Messenger" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-02
version "0.1"
description "Mibew Messenger (also known as Open Web Messenger) is an open-source live support application written in PHP and MySQL."
website "http://mibew.org/"

# Google results as at 2012-02-02 #
# 66 for "Mibew Messenger" "2011 mibew.org" intitle:"Mibew Messenger"
# 51 for "Mibew Messenger" "mibew.org" intitle:"Mibew Messenger" inurl:"operator/restore.php"

# Dorks #
dorks [
'"Mibew Messenger" "mibew.org" intitle:"Mibew Messenger" inurl:"operator/restore.php"'
]



# Matches #
matches [

# Copyright Footer # Version Detection
{ :version=>/<p id="legal"><a href="http:\/\/mibew\.org\/" class="flink">Mibew Messenger<\/a> ([^\s]+) \| \(c\) 20[\d]{2} mibew\.org<\/p>/ },

# div class="empty_inner"
{ :certainty=>75, :text=>'<div class="empty_inner" style="">&#160;</div>' },

]

end

