##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "php-Charts" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-01-21
version "0.1"
description "php-Charts is a class which can be used to generate different charts in different formats (PDF, PNG, JPG, HTML) using different data sources (csv, xml, MySQL, MS Sql, MS Access, PostgreSql, user defined data)."
website "http://php-charts.com/"



# Matches #
matches [

# src # url.php partial query string
{ :certainty=>25, :regexp=>/\b(href|src)\s*=\s*["'][^>]*url\.php\?type=bar&dimension=[^\s^&]+&data_type=[^\s^&]+&file_path=[^&]+&group_col=[^\s^&]+&series_col=[^\s^&]+&output_type=[^\s^&]+/ },

]

end

