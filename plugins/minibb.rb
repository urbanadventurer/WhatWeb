##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MiniBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "MiniBB is a free standalone open source program for building your own Internet forum."
website "http://www.minibb.com/"

# Google results as at 2011-02-27 #
# 210 for "Powered by MiniBB"

# Dorks #
dorks [
'"Powered by MiniBB"'
]



# Matches #
matches [

# Default Copyright HTML Comment
{ :text=>'<td class="tbTransparent txtR"><!--miniBB Copyright link. You are not allowed to remove it if you have not purchased the Commercial License. Refer to COPYING file for more-->' },

# Powered by text
{ :regexp=>/Powered by <a[^>]+href="http:\/\/www.minibb.(com|net)"[^>]*>miniBB[^<]{0,15}<\/a>/i },

# Version Detection # Powered by text
{ :version=>/Powered by <a[^>]+href="http:\/\/www.miniBB.(com|net)"[^>]*>miniBB ([^<]{1,7})<\/a>/i, :offset=>1 },

]

end


