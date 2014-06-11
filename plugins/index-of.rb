##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :probability & :name

Plugin.define "Index-Of" do
author "Andrew Horton"
version "0.2"
description "Index of"

# Dorks #
dorks [
'name "last modified" size description'
]



# Apache2 http://www.ibiblio.org/pub/
#<a href="?C=N;O=D">Name</a>                     <a href="?C=M;O=A">Last modified</a>

# Apache2.2
# <th><a href="?C=N;O=D">Name</a></th><th><a href="?C=M;O=A">Last modified</a></th>

# Apache/2.2.3 (CentOS) Server at loop-aes.sourceforge.net
# <pre>Name                         Last modified      Size  <hr>

# Apache/2.0.52 (Unix) Server at www.gap-system.org
# <a href="?C=N;O=D">Name</a>                    <a href="?C=M;O=A">Last modified</a> 

# Apache/1.3.26 Server at www.czyborra.com
# <A HREF="?N=D">Name</A>                    <A HREF="?M=A">Last modified</A>

# Matches #
matches [
{:text=>'<title>Index of /' },
{:certainty=>75, :ghdb=>'name "last modified" size description' },
{:text=>'<a href="?C=N;O=D">Name</a></th><th><a href="?C=M;O=A">Last modified</a>' },
{:regexp=>/<a href="\?C=N;O=D">Name<\/a>[\s]*<a href="\?C=M;O=A">Last modified<\/a>/ },
{:regexp=>/<pre>Name[\s]+Last modified[\s]+Size[\s]+<hr>/ },
{:regexp=>/<A HREF="\?N=D">Name<\/A>[\s]+<A HREF="\?M=A">Last modified<\/A>/ },
{:name=>"minimal apache listing",
:regexp=>/<title>Index of \/[^<]*<\/title>[\s]*<\/head>[\s]*<body>[\s]*<h1>Index of / }
]

end

