##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Kinja" do
author "Sigit Dewanto"
version "0.1"
description "Kinja is Gawker Media's discussion platform."
examples %w|http://www.gizmodo.com http://kotaku.com|

def passive
    m = []
    m << { :name=>"X-Kinja Header" } unless @headers["x-kinja"].nil?
    m
end

end
