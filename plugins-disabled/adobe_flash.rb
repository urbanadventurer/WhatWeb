##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# ~ Brendan Coles bcoles@gmail.com
# Added JavaScript detection
# Added <embed> element detection
# Added flash file path retrieval
##
Plugin.define "Adobe-Flash" do
author "Caleb Anderson"
version "0.2"
description "This plugin identifies instances of embedded adobe flash files and attempts to retrieve the flash file path."

# 244 results for "your browser does not support flash" @ 2010-10-14
examples %w|
www.arride.com
www.benchmarktravel.co.uk
www.centralschoolofballet.co.uk
www.jijauamalner.org
www.nexavar-international.com/scripts/pages/en/home/index.php
www.pizzahut.co.nz
www.plunkettcooney.com
www.sachsbikes.co.uk
|

matches [

# Object tag
{ :regexp=>/<object.*?>*?application\/x-shockwave-flash.*?<\/object>/i },

# Extract flash file path from <embed> elements
{ :version=>/<embed[^>]+src[\s]*=[\s]*([^\ ]+)/i, :version_regexp_offset=>0 },

# Extract flash file path from Javascript
{ :version=>/new[\s]+FlashObject[\s]*\([\s]*'([^\']+)/, :version_regexp_offset=>0 },
{ :version=>/new[\s]+FlashObject[\s]*\([\s]*"([^\"]+)/, :version_regexp_offset=>0 },
{:version=>/new[\s]+SWFObject[\s]*\([\s]*'([^\']+)/, :version_regexp_offset=>0},
{:version=>/new[\s]+SWFObject[\s]*\([\s]*"([^\"]+)/, :version_regexp_offset=>0},
{ :version=>/.embedSWF[\s]*\([\s]*'([^\']+)/, :version_regexp_offset=>0 },
{ :version=>/.embedSWF[\s]*\([\s]*"([^\"]+)/, :version_regexp_offset=>0 },

]

end

