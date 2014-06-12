##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "error_log" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-12-28
version "0.1"
description "This plugin identifies PHP error_logs and and extracts the local file path."

# Google results as at 2011-02-12 #
# 847,000 for warning|error inurl:error_log +PHP "on line"
# 269 for warning|error inurl:error_log +PHP "on line" inurl:".gov"

# Dorks #
dorks [
'warning|error inurl:error_log "PHP" "on line"'
]



# Matches #
matches [

# Extract local file path
{ :filepath=>/\[[\d]{2}\-[A-Za-z]{3,4}\-[\d]{4} [\d]{2}:[\d]{2}:[\d]{2}\] PHP .{1,50}: .* in (.*) on line [0-9]+/ },

# Extract username
{ :account=>/\[[\d]{2}\-[A-Za-z]{3,4}\-[\d]{4} [\d]{2}:[\d]{2}:[\d]{2}\] PHP .{1,50}: .* in \/home\/([^\/]{1,32})\/.* on line [0-9]+/ },

]

end


