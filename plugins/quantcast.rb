##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty

Plugin.define "Quantcast" do
author "Andrew Horton"
version "0.1"
description "Visitor demographics and statistics. www.quantcast.com"

=begin
#
# standard
<!-- Start Quantcast tag -->
<script type="text/javascript" src="http://edge.quantserve.com/quant.js"></script>
<script type="text/javascript">_qoptions = { tags:"Gawker Geek" }; _qacct="p-d4P3FpSypJrlA";quantserve();</script>
<noscript>
<a href="http://www.quantcast.com/p-d4P3FpSypJrlA" target="_blank"><img src="http://pixel.quantserve.com/pixel/p-d4P3FpSypJrlA.gif?tags=Gawker%20Geek" style="display: none;" border="0" height="1" width="1" alt="Quantcast"/></a>
</noscript>
<!-- End Quantcast tag -->

# shorter
#<!-- Start Quantcast tag --><script type="text/javascript" src="http://edge.quantserve.com/quant.js"></script><script type="text/javascript">_qacct="p-eeQ5-n64VG-GM";quantserve();</script><noscript><img src="http://pixel.quantserve.com/pixel/p-eeQ5-n64VG-GM.gif" style="display: none" height="1" width="1" alt="Quantcast"/></noscript><!-- End Quantcast tag -->

# shortest
#<!-- Start QC tag --><script type="text/javascript">_qoptions={qacct:"p-75z9nhQwNH4Ek"};</script><script type="text/javascript" src="http://edge.quantserve.com/quant.js"></script><noscript><img src="http://pixel.quantserve.com/pixel/p-75z9nhQwNH4Ek.gif" style="display: none;" border="0" height="1" width="1" alt="Quantcast"/></noscript><!-- End QC tag -->
=end

matches [
{:name=>"quant.js", :regexp=>/<script[^>]+src=["']http:\/\/edge.quantserve.com\/quant.js["']/ }

]



end


