##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :name & :probability
Plugin.define "NovellGroupwise" do
author "Andrew Horton"
version "0.2"
# identifying strings
# <!-- START NOVELL SERVICES -->
# <!-- START GROUPWISE WEBACCESS -->
# <!-- ========== GroupWise WebAccess Form ========== -->
# <b>GroupWise WebAccess:</b>
# &copy; Copyright 1993-2006 Novell, Inc. All rights reserved
# <title>Novell Web Services</title>


matches [
{:text=>"<!-- START NOVELL SERVICES -->"},
{:text=>"<!-- START GROUPWISE WEBACCESS -->"},
{:text=>"<title>Novell Web Services</title>"}
]


end

