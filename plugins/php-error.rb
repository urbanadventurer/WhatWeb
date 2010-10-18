##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # Brendan Coles <bcoles@gmail.com>
# Added local file path extraction
# Version 0.2
# removed :certainty

Plugin.define "PHP-Error" do
author "Andrew Horton"
version "0.3"
description "This plugin identifies PHP errors and extracts the local file path."

examples %w|
itpak.net/wp-content/themes/default/
studio306.com/weblog/wp-content/themes/default/
yvonnelao.com/wp-content/themes/default/
zendedel.com/blog/wp-content/themes/classic/index.php
www.nurse-power.com/blog/wp-content/themes/default/
www.wunschrausch.com/blog/wp-content/themes/default/
|

matches [

# Extract local file path
{ :version=>/<b>(Warning|Fatal error)<\/b>: .* in <b>([^<]+)<\/b> on line <b>[0-9]+<\/b><br \/>/, :version_regexp_offset=>1 },

]

end


