##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "4images" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-18
version "0.1"
description "4images is a powerful web-based image gallery management system. Features include comment system, user registration and management, password protected administration area with browser-based upload and HTML templates for page layout and design. - homepage: http://www.4homepages.de/"

# 356 results for "powered by 4images" +4homepages.de @ 2010-09-18
examples %w|
felicitari.stancamantuirii.net
kresby.grafika.cz
library.lakeforest.edu/collections/benton/4images/
neisri.ru/4images/
www.azooz.net
www.girls-on-bikes.com
www.opinionsocial.com.ar/imagenes/inicio/
www.pcm60.org/galerie/
www.portsaid-online.com/panorama/
www.quimica.unam.mx/galeria/
www.voreart.com/vorevideo/
|

matches [

# Copyright text
{ :regexp=>/Copyright &copy; 2002-[0-9]{4} <a href="http:\/\/www.4homepages.de[\>]*>4homepages.de<\/a>/ },

# Version detection # Powered by text
{ :version=>/Powered by <b>4images<\/b> ([\d\.]+)/ },

]

end

