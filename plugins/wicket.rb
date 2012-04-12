##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Apache Wicket Framework" do
author "Steve 'Ashcrow' Milner"
version "0.1"
description "Apache Wicket Framework (http://wicket.sourceforge.net/)"

matches [

{:name=>'XMLNS data',
 :certainty=>100,
 :regexp=>/xmlns:wicket="(http:\/\/wicket\.sourceforge\.net\/|http:\/\/wicket\.apache\.org\/)">/ },

{:name=>'Wicket default URL scheme',
 :certainty=>100,
 :regexp=>/(http)?(s)?(:\/\/)?(.*)\?wicket:bookmarkablePage=/ },

{:name=>'Wicket ID scheme',
 :certainty=>75,
 :regexp=>/ wicket:id="[^"]*"/},

{:name=>'Wicket Resource scheme',
 :certainty=>25,
 :regexp=>/<[^=]+[ ]?=[ ]?['"]?wicket\/[^\/]+\/org\.apache\.wicket\./},

]

end
