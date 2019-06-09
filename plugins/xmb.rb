##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "eXtreme-Message-Board"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-10-12
]
version "0.1"
description "XMB is a lightweight PHP forum software with all the features you need to support a growing community."
website "http://www.xmbforum.com/"

# 304 results for "powered by XMB" @ 2010-10-12

# Dorks #
dorks [
'"powered by XMB"'
]

matches [

# Default HTML comments
{ :text => '<!-- Powered by XMB ' },
{ :text => '<!-- The XMB Group -->' },

# Version detection # Powered by text
{ :name => 'Powered by footer',
  :version => /^Powered by XMB ([\d\.]+)<br \/>/ },

# Version detection # Default title
{ :name => 'Title',
  :version => /<title>[^<]+- Powered by XMB ([\d\.]+) / },

# Version detection # HTML comments
{ :name => 'HTML comment',
  :version => /^<!-- Powered by XMB ([\d\.]+) / },

]

end

