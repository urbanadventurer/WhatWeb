##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "DUclassified" do
author "Tonmoy Saikia"
version "0.1"
description "DUclassified is a free Classified Ad Management system"

examples %w|
http://www.whwebandgraphics.com/DUclassified/
http://www.mamamx.com/classified/
http://www.wmha.mb.ca/classifieds/
http://www.maccallini.it/link_categorie/
http://www.wcri.coop/dusublets/
http://www.businesslist.com.au/duclassifieds/
http://www.qianhu.com/content/DUclassified/
http://www.wcri.coop/dusublets/
http://www.wmha.mb.ca/classifieds/
http://www.qianhu.com/content/DUclassified/
http://www.andrewfinch.co.uk/4x4/Noticeboard/
http://www.bichitrainc.com/classified_ads/DUClassified/
http://www.gtkdata.com/haydenstowing/duclassifieds/ 
|

#<title>DUclassified</title>
#:<title>DUclassified 4.0</title>
# <link href="assets/DUclassified.css" rel="stylesheet" type="text/css"> 


matches [
{:certainty=>75, :ghdb=>'"powered by DUclassified" intitle:DUclassified' },
{:name=>"default title", :regexp=>/<title>DUclassified[\s\d\.\d]*<\/title>/},
{:name=>"assets/DUclassified.css", :regexp=>/<link[^>]href="[^"]*assets\/DUclassified.css"[^>]+>/ }#"

]

end

