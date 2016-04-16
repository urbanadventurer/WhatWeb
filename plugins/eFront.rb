##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eFront" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-28
version "0.1"
description "eFront is a modern learning system, bundled with key enterprise functionality ranging from skill-gap analysis and branch management to tailor-made reports."
website "http://www.efrontlearning.net/"

# Google results as at 2011-10-28 #
# 514 for inurl:"index.php?ctg=contact"
# 236 for allintext:"efront version" "Community Edition" "Contact us"

# Dorks #
dorks [
'inurl:"index.php?ctg=contact"',
'allintext:"efront version" "Community Edition" "Contact us"'
]



# Matches #
matches [

# body
{ :text=>'<body  onkeypress = "if (window.eF_js_keypress) eF_js_keypress(event);" onbeforeunload = "if (window.getPeriodicData) getPeriodicData();">' },

# JavaScript
{ :text=>"<script>var BOOKMARKTRANSLATION = 'Bookmarks';var NODATAFOUND = 'No data found';</script>" },
{ :text=>'</script><script>if (__shouldTriggerNextNotifications) { new Ajax.Request("send_notifications.php?ajax=1", {method:\'get\', asynchronous:true}); } </script>' },

# Version Detection # Footer
{ :version=>/<div><a href = "http:\/\/www\.efrontlearning\.net">eFront<\/a> \(version ([^\)]+)\) &bull; Community Edition &bull; <a href = "index\.php\?ctg=contact">/ },

# Version Detection (Build) # JavaScript
{ :version=>/<script type = "text\/javascript" src = "js\/scripts\.php\?(build=[\d]+)&load=[^"^>]+"> <\/script>/ },

]

end

