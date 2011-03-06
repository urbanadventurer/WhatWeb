##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "QuickerSite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-04
version "0.1"
description "QuickerSite is a Content Management System for Windows Servers. It is written in ASP/VBScript with an optional pinch of ASP.NET for true image-resizing capabilities. - Homepage: http://www.quickersite.com/"

# Google results as at 2011-03-04 #
# 111 for "Powered by QuickerSite"

# Examples #
examples %w|
www.quickersite.com
www.iseral.be
www.tecnoambiente-ro.it
degitaar.iseral.be
www.museocieloeterra.org
www.interxpose.com
www.kikkerfreak.be
www.diapasonsnc.it
www.eigen-kracht.be
www.museoarcheologicoambientale.it
www.dogs-centro-hondentraining.be
www.wimtuerlinckx.be
www.laxrefs.org
www.cambodia.fite.co.nz
www.burchettfamily.com
elitestonechicago.com
www.cafe93.co.nz
www.delrayac.com
www.concretepumps.be
www.buckydentbaseballschool.com/BDBS/
www.delraysoccer.com
www.emergeconsultancy.co.nz
www.globaltribe.co.nz
www.softwarepmi.com
martineser.de
www.hosdorisoboris.se
quickersite.testsites.dk
www.rollladen-daemmung.com
www.doarisrael.com
|

# Matches #
matches [

# Meta Generator
{ :regexp=>/<meta content="QuickerSite CMS - visit www.quickersite.com" name="generator" \/>/i },

{ :regexp=>/<meta name="generator" content="QuickerSite CMS - visit www.quickersite.com">/i },

]

end


