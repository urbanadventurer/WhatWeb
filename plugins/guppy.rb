##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-10 #
# Updated version detection
##
Plugin.define "GuppY" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-06
version "0.2"
description "An easy, free web portal, GuppY will allow you to generate very easily a complete and interactive web site. It requires no database. - homepage: http://www.freeguppy.org/?lng=en"

# Google results as at 2010-08-06 #
# 326 for "Powered by GuppY" "CeCILL Free License"

# Examples #
examples %w|
www.freeguppy.org
www.freeguppy.nl
www.safari-dream.com/mobile/
j.mathieu.free.fr/guppy/guppy/
perso.bozzoland.com
iguppy.free.fr
d-f-c.co.uk/guppy/mobile/
eglisemali.org
www.abbadiani.it/guppy/index.php
www.oca.eu/gemini/ecoles_colloq/colloques/ilrs2007/
www.ac-nice.fr/iennice3/plandariou/C1/
www.viewtalay.net
www.whenweruled.com
www.guppyskin.424.pl
www.calao-systems.com
lescondamnes.ifrance.com
www.letarto.com/build1/
snowsport.nl
www.freetotryblackjack.com
www.zoaeter.com
www.euromyasthenia.org
shop.sgier.com
www.armurier-gunsmith.com
asso.orpha.net/CREAF22/cgi-bin/mobile/
www.pathways4u.net
www.osteo-larevue.com/olr/
cnbt.awardspace.com
www.dymanassociates.com
www.eyeandpen.net
www.arlettesteenmans.com
www.hiflyersagility.ca/guppy_prod/
www.lcrea.com
www.alissongothz.com.br/leighbowery/xtravaganza/mobile/
www.seminaire-drome.fr
boostair.com
fenomanana.org
biodivmap.net
www.sgtp.net/AndreaSplendiani/
www.bbiff.com
superdgaming.com
www.debstar.com/meshack/
www.exekrator.com
www.aalals.org
www.casa-naima.com/location/
www.inma.ucl.ac.be/networks/
penarthcomputers.com
www.coachabeloos.com
www.hiertz.de
www.calao-systems.eu
acomm.nuxit.net/galerie/
www.cassislocations.com
www.clinicasmaya.com/es/
opiam.sourceforge.net
www.thorvis.com
engasser.tp.free.fr
www.silverleaf.dk
cultureparks.org/php/
www.cardiffcomputers.co.uk
www.chouberg.com
www.ase.com.ua
autoconstruction-bois.fr
www.business-import-ltd.com/mobile/
www.lab.cnrs.fr/openblockslib/
www.metalchroniques.fr/guppy/mobile/
www.bingo-vip.com
www.expertsforestiers.info
www.rwamrec.org
www.fateh-emam.com
www.srilanka.icws.dk
www.cse.iitb.ac.in/~saju/
www.teamos2.dk
www.planet-4u.com
www.frabato.fr
www.naaarf.com/antibes/
sdbpontiac.com
cardiffcomputers.com
www.fp-project.com
www.paulmcgillionfans.com
www.ireni.fr
www.philippinischer-kulturkreis.de
leamsiministries.org
www.cosmic-ride.com/soldiers-of-freeride/
www.diekrugers.com
nouaux.chez.com
airdeglisse.free.fr
cms2.bogari.lv
www.linuxidx.com
www.vk-profit.com
surfwinner.chez.com
www.duivenstartpunt.com/fml2/
f5swn.2.free.fr
www.yosif.net
rpgfr.ifrance.com
segpabastie.free.fr/maryse/
2manydjs.free.fr
health.roots.free.fr/mobile/
sexy-live-center.com/sexy-streming/
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="Generator" content="GuppY">' },

# Version Detection # Copyright Footer HTML
{ :version=>/<div class="foot"><span class='copyright'>&nbsp; <a class='copyright' href='http:\/\/www.freeguppy.org\/' title='GuppY site' target='_blank'> Site powered by GuppY v([\d\.]+) <\/a>/ },

# Version Detection # HTML Comment
{ :version=>/  <!--\[  GuppY v([\d\.]+) CeCILL Copyright \(C\) [\d]{4}\-[\d]{4} by Laurent Duveau \- http:\/\/www.freeguppy.org\/  \]-->/ },

]

end

