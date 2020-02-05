##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
#
Plugin.define do
	name "Bootstrap"
	authors [
		"Janosch Maier @Phylu", # v0.1 # 2020-02-05 # Created plugin
	]
	version "0.1"
	description "Bootstrap is an open source toolkit for developing with HTML, CSS, and JS. "
	website "https://getbootstrap.com/"

	# Matches #
	matches [

    # JavaScript
    { :regexp=>/<script [^>]*bootstrap/ },

    # CSS
    { :regexp=>/<link [^>]*bootstrap/},

    # JavaScript # Version Detection
    { :version=>/bootstrap(\.min)?\.js\?ver=([0-9\.]+)['"]/, :offset=>1 },
    { :version=>/bootstrap\/([0-9\.]+)(\/js)?\/bootstrap(\.min)?\.js/, :offset=>0 },
    { :version=>/bootstrap-([0-9\.]+)(\.min)?\.js/, :offset=>0 },

    # CSS # Version Detection
    { :version=>/bootstrap(\.min)?\.css\?ver=([0-9\.]+)['"]/, :offset=>1 },
    { :version=>/bootstrap\/([0-9\.]+)(\/css)?\/bootstrap(\.min)?\.css/, :offset=>0 },
    { :version=>/bootstrap-([0-9\.]+)(\.min)?\.css/, :offset=>0 }

	] 

end
