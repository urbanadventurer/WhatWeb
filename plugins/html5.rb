##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :probability
##
Plugin.define "HTML5" do
author "Andrew Horton"
version "0.2"
description "HTML version 5, detected by the doctype declaration"




# Matches #
matches [

{ :regexp=>/<!DOCTYPE html>/i },
{ :string=>"applicationCache", :regexp=>/<html[^>]* manifest=/ },

]

end

