##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.6 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 0.5 # 2011-08-23 # Andrew Horton
##
# Version 0.4 # 2011-05-25 # Brendan Coles <bcoles@gmail.com>
# Merged php-error plugin and PHP plugin
# Added aggressive version detection using PHP credits page
# Added detection for "PHP Warning" HTTP header
##
# Version 0.3 # 2011-03-26 # Brendan Coles <bcoles@gmail.com>
# Added module detection
##
# Version 0.2 # 2011-01-19 # Brendan Coles <bcoles@gmail.com>
# Updated regex matches
##
Plugin.define "PHP" do
author "Andrew Horton & Brendan Coles" # 2010-10-26
version "0.6"
description "PHP is a widely-used general-purpose scripting language that is especially suited for Web development and can be embedded into HTML. This plugin identifies PHP errors, modules and versions and extracts the local file path and username if present."
website "http://www.php.net/"

# ShodanHQ results as at 2011-05-25 #
# 5,345,848 for "server: PHP"
# 3,565,299 for "X-Powered-By: PHP"
# 189 for php-warning
# 30 for Error parsing on line

# Google results as at 2011-05-25 #
# 478 for PHP warning|error "in /home/*.php on line" ext:php -forum
# 463 for warning|error PHP inurl:error_log "in /home/*.php on line"
# 33 for PHP warning|error "in C:\Documents and Settings\*.php on line" ext:php -forum

# Dorks #
dorks [
'PHP warning|error "in /home/*.php on line" ext:php -forum',
'warning|error PHP inurl:error_log "in /home/*.php on line"'
]



# Matches #
matches [

# Aggressive # Version Detection # Credits Page
{ :url=>"/?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000", :version=>/<tr class="h"><th colspan="2">PHP (\d) Authors<\/th><\/tr>/ },
{ :url=>"/?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000", :version=>/<tr class="h"><th>PHP ([\d\.]+) Quality Assurance Team<\/th><\/tr>/ },

# PHP-Error # Extract local file path
{ :filepath=>/<b>(Warning|Fatal error)<\/b>: .* in <b>([^<]+)<\/b> on line <b>[0-9]+<\/b><br \/>/, :offset=>1 },

# PHP-Error # Extract username from unix style file path
{ :account=>/<b>(Warning|Fatal error)<\/b>: .* in <b>\/home\/([^<^\/]+)\/[^<]*<\/b> on line <b>[0-9]+<\/b><br \/>/, :offset=>1 },

# PHP-Error # Extract username from windows style file path
{ :account=>/<b>(Warning|Fatal error)<\/b>: .* in <b>[A-Z]{1}:\\(Documents and Settings|Users)\\([^<^\\]+)\\[^<]*<\/b> on line <b>[0-9]+<\/b><br \/>/i, :offset=>2 },


# HTTP # Server # Version Detection
{ :version=>/[^\r^\n]*PHP\/([^\s^\r^\n]+)/, :search=>"headers[server]" },

# HTTP # Server # Module Detection
{ :module=>/[^\r^\n]*PHP\/[^\s^\r^\n]+ with (Hardening-Patch|Suhosin-Patch)/, :search=>"headers[server]" },

# HTTP # X-Powered-By
{ :version=>/[^\r^\n]*PHP\/([^\s^\r^\n]+)/, :search=>"headers[x-powered-by]" },

# HTTP # X-Powered-By # Module Detection
{ :module=>/[^\r^\n]*PHP\/[^\s^\r^\n]+ with (Hardening-Patch|Suhosin-Patch)/, :search=>"headers[x-powered-by]" },

# PHP Error # PHP HTTP Header
{ :regexp=>/^Error parsing (.+) on line [\d]+$/, :search=>"headers[php]" },

# Local Filethpath Detection # PHP HTTP Header
{ :filepath=>/^Error parsing (.+) on line [\d]+$/, :search=>"headers[php]" },

# Account Detection # PHP HTTP Header
{ :filepath=>/^Error parsing \/home\/([^\/]+)\/.+ on line [\d]+$/, :search=>"headers[php]" },

# PHP Warning Header
{ :name=>"PHP Warning Header", :regexp=>//, :search=>"headers[php warning]" },

]


end

