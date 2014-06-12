##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenNewsletter" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "Open source mailing list manager with builds from Self Exile, NetMeans.Net and Quadro.Net"

# Google results as at 2011-03-15 #
# 9 for "This is a Free & Open Source mailing list manager" -dork

# Dorks #
dorks [
'"This is a Free & Open Source mailing list manager" -dork'
]



# Matches #
matches [

# Self Exile
{ :text=>'This is a <a href=fsw.php>Free</a> & <a href=osd.php>Open Source</a> mailing list manager developed by <a href=selfexile.php>Self Exile</a> and distributed under the <a href=gpl.php>GPL</a>.', :string=>"Build: Self Exile" },
{ :text=>'This is a <a href=fsw.php>Free</a> & <a href=osd.php>Open Source</a> mailing list manager developed by <a href=feedback.php>Self Exile</a> and distributed under the <a href=gpl.php>GPL</a>.', :string=>"Build: Self Exile" },

# NetMeans.Net
{ :text=>'This is a Free & Open Source mailing list manager developed by <a href="http://netmeans.net">NetMeans.Net</a> and distributed under the LGPL license. This software is based on the OpenNewsletter project by <a href="http://www.selfexile.com" target="_blank">Self Exile</a>.', :string=>"Build: NetMeans.Net" },

# Quadro.Net
{ :text=>'This is a Free & Open Source mailing list manager developed by <a href="http://www.quadronet.net">Quadro Net</a> and distributed under the LGPL license. This software is based on the OpenNewsletter project by <a href="http://www.selfexile.com" target="_blank">Self Exile</a> and NmnNewsletter by <a href="http://netmeans.net">NetMeans.Net</a>.', :string=>"Build: Quadro.Net" },

]

end


