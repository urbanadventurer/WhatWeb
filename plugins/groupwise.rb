##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2
# removed :name & :probability
##
Plugin.define "NovellGroupwise" do
author "Andrew Horton"
version "0.2"
description "GroupWise collaboration software is a premier collaboration tool for large enterprise. - Homepage: http://www.novell.com/products/groupwise/"

# Matches #
matches [

# HTML Comments
{:text=>"<!-- START NOVELL SERVICES -->"},
{:text=>"<!-- START GROUPWISE WEBACCESS -->"},

# Title
{:text=>"<title>Novell Web Services</title>"}

]

end

# identifying strings
# <!-- START NOVELL SERVICES -->
# <!-- START GROUPWISE WEBACCESS -->
# <!-- ========== GroupWise WebAccess Form ========== -->
# <b>GroupWise WebAccess:</b>
# &copy; Copyright 1993-2006 Novell, Inc. All rights reserved
# <title>Novell Web Services</title>


