##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# remove :certainty

Plugin.define do
name "PHPCake"
author "Andrew Horton"
version "0.2"
description "PHP MVC web framework"

# Set-Cookie: CAKEPHP=f3780e7684b29ac421af120d774f1ca9; expires=Tue, 08 Aug 2034 13:47:56 GMT; path=/

passive do
  m=[]
  m << {:name=>"CAKEPHP Cookie" } if @headers["set-cookie"] =~ /CAKEPHP=.*/
  m
end

end

