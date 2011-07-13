##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tradingeye" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-13
version "0.1"
description "Tradingeye is a fully-featured web standards compliant Shopping Cart & CMS, built from the ground up with web accessibility and SEO in mind. - Homepage: http://tradingeye.com/"

# Google results as at 2011-07-13 #
# 267 for "Powered by Tradingeye" "You are here: Home"

# Dorks #
dorks [
'"Powered by Tradingeye" "You are here: Home"'
]

# Examples #
examples %w|
demov6.tradingeye.com
www.pattinsonscientific.com
www.silveruk925.com
www.wrightcoachanddevelopment.co.uk
www.solarsecuritysolutions.co.uk
halogencom.com
www.progressive-bikes.co.uk
halogencom.com
www.ghceramics.com
www.otterdisplay.com
www.shallowfordretrievers.co.uk
www.dogtrainingharnesses.co.uk
www.expressdance.co.uk
logs-uk.co.uk
www.hotel-solutions.co.uk
www.scotia-supplies.com
www.pampaswines.com
shop.clpe.co.uk
shop.royalparksfoundation.org
www.cyclearound.co.uk
www.premierhh.co.uk
www.slimbrick.co.uk
www.westrayrecruitment.co.uk/index/
|

# Matches #
matches [

# Aggressive # favicon.ico
{ :url=>"/favicon.ico", :md5=>"0ec12e5820517d3b62e56b9a8f1ee5bc" },
{ :url=>"/_assets/img/site/favicon.ico", :md5=>"0ec12e5820517d3b62e56b9a8f1ee5bc" },

# Powered by text
{ :text=>'<p id="credits"><a href="http://www.tradingeye.com/">powered by Tradingeye</a></p>' },

# Meta Author
{ :text=>'<meta name="author" content="dpivision.com Ltd" />' },

# p id="breadcrumbs"
{ :certainty=>25, :text=>'<p id="breadcrumbs">You are here:' },

# HTML Comment
{ :certainty=>25, :text=>'</div><!-- end body/inner -->' },

# skip to main content
{ :text=>'<p id="skip">[<a href="#main">skip to main content</a>]</p>' },

# Version Detection # Admin Page # Title
{ :version=>/<title>Tradingeye v([^\s]+) :: Online Admin<\/title>/ },

# Admin Page # th class="login_bg"
{ :text=>'<th class="login_bg" colspan="2">Tradingeye Login</th>' },

]

end

