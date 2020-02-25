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
                                # v0.2 # 2020-02-07 # Added aggressive version detection
                                # v0.3 # 2020-02-19 # Improved aggressive version detection
	]
	version "0.3"
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
    { :version=>/bootstrap-([0-9\.]+)(\.min)?\.css/, :offset=>0 },

    # JavaScript # Version Detection # Agressive
    { :url=>"bootstrap/js/bootstrap.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"bootstrap/js/bootstrap.bundle.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"bootstrap/js/bootstrap.min.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"bootstrap/js/bootstrap.bundle.min.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"js/bootstrap.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"js/bootstrap.bundle.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"js/bootstrap.min.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"js/bootstrap.bundle.min.js", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },

    # CSS # Version Detection # Agressive
    { :url=>"bootstrap/css/bootstrap.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"bootstrap/css/bootstrap.bundle.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"bootstrap/css/bootstrap.min.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"bootstrap/css/bootstrap.bundle.min.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"css/bootstrap.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"css/bootstrap.bundle.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"css/bootstrap.min.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 },
    { :url=>"css/bootstrap.bundle.min.css", :version=>/Bootstrap ([vV])?([0-9\.]+)/, :offset=>1 }

	] 

end
