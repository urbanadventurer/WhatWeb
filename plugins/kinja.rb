##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Kinja"
authors [
  "Sigit Dewanto",
]
version "0.1"
description "Kinja is Gawker Media's discussion platform."

matches [
{ :name=>"X-Kinja Header", :regexp=>/^$/, :search=>"headers[x-kinja]" }
]


end
