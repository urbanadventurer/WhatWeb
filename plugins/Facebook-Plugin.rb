##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Facebook-Plugin" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "This plugin identifies Facebook plugins - Homepage: http://apps.facebook.com/widgets/"
# More Info: http://developers.facebook.com/docs/plugins

# Examples #
examples %w|
www.fblike.net
fblike.net/girls.php
fblike.net/funny.php
fblike.net/teens.php
fblike.net/inspire.php
fblike.net/quotes.php
fblike.net/ttp.php
fblike.net/other.php
www.polyvore.com/bohemian/collection?id=341518
www.polyvore.com/like_her_style_lauren_conrad/collection?id=478808
www.salvationarmy.org.au/corpsresources/resource.asp?offset=50
www.thenewsuitors.com
www.anuzisimages.com
www.essex.ac.uk/sociology/student_journals/ug_journal/
|

# Matches #
matches [

# Widget Detection # Iframe version
{ :string=>/<i?frame[^>]+src[\s]*="http:\/\/(www|apps)\.facebook.com\/plugins\/([^\.^\/^\?]+)\.php\?/i, :offset=>1 },

]

end


