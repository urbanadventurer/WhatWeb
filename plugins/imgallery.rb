##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IMGallery" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-27
version "0.1"
description "image gallery web app - homepage: http://www.imgallery.zor.pl"
examples %w|
www.fototaurus.yoyo.pl
www.sylviafoto.yoyo.pl
a-foto.yoyo.pl
www.mikolajrusak.yoyo.pl
www.galafilm.yoyo.pl/index.php
www.galeria-czatu-us5poland.yoyo.pl
www.naguski.yoyo.pl/galeria/albumy.php
wojkup.yoyo.pl
www.lyon-gallery.yoyo.pl
www.photosbyme.yoyo.pl
www.buldog1.yoyo.pl
www.stare-jaworzno.yoyo.pl
www.kfnrd.yoyo.pl
www.g-ruszkowski.yoyo.pl
www.galeriavan.yoyo.pl
www.bonzai.yoyo.pl
www.lzsnaprzod.yoyo.pl/galeria/IMGallery/index.php
g2-sites.com
www.imgallery.net/index.php
www.foto-rador.xon.pl
www.chamczyk.yoyo.pl
www.katarzynaboryna.pl
www.dyskoteka.pl/galeria/
www.los.opocznianie.pl
3lo.home.pl/imgallery/
www.golebie.wombat.fc.pl/
www.foto.karwia.pl
www.gimpudliszki.pl/IMGallery/index.php
www.go2poland.com/galeria/galeria.php
brazowa.franciszkanie.pl/IMGallery/index.php
rypin.info.pl/przedszkola/IMGallery/index.php
www.zjednoczeni.zarow.pl/galeria/
www.boromeuszki.katowice.opoka.org.pl/IMGallery/albumy.php
www.pielgrzymki.katowice.pl/IMGallery/albumy.php
ju-jitsu.konin.pl/IMGallery/albumy.php
www.projekt-buka.pl
www.lo.kroscienko.pl/imgallery/index.php
www.tkkf.domenomania.pl/galeria/
www.broniewski.ostrowiec.pl/fotos/index.php
www.zsnr1bialapiska.pl/IMGallery/
galeria.forum.nysa.pl/albumy.php
www.wawelbergbydgoszcz.edu.pl/IMGallery/index.php
www.fgt.cba.pl/galeria/index.php
www.dariafoto.pl
www.galeria.michala.ozz.pl
www.kosciuszko.stalowa-wola.pl/sportowe/IMGallery/
www.formula.org.pl/IMGallery/index.php
www.jeleniagoranaszdom.pl/galeria/galeria.php
www.fotomarceli.com/albumy.php
www.galeria.paradise-taniec.pl/index.php
www.leba-kurort.pl/galeria/kategorie.php
www.fantasy.nietykalni.biz/galerie/index.php
www.zespol.parnoforo.wer.pl
www.fastgarage.jeal.pl
www.rena.internetdsl.pl/galeria/
misiu1401.lua.pl
mksvisskierniewice.pl/IMGallery/kategorie.php
puszczyk.website.pl/galeria/
galeria.strzelectwo.biz/albumy.php
mkspodlasie.pl/galeria/kategorie.php
www.foto-lubawa.to.pl
sokol.waw.pl/imgalery/albumy.php
www.galeria.melsztyn.pl
autobusy.murowana.pl/albumy.php
www.szymczuk.pl/decydujacymoment2/index.php
www.cystersi.sulejow.ddl2.pl/IMGallery/galeria.php
wwwwww.3lo.bydgoszcz.pl/imgallery/galeria.php
www.foto.misiek.org
www.fotokozia.dmkhosting.net/nowa/
www.antdom.pl/galeria/galeria.php
www.redemptor.elblag.pl/galeria/
www.trinity-cheerleaders.com/IMGallery2/albumy.php
www.foto.hoffman.auto.pl/albumy.php
www.photogallery.pl
www.wczasynadmorzem.cri.pl/galeria.php
www.wtz-jawor.pl/galeria/galeria.php
www.fg-polska.pl/galeria/kategorie.php
www.gimnazjum.radomyslwielki.pl/Galeria/index.php
www.ubrankawizytowe.pl/galeria.php
goraszka.info/galeria/
www.natort.pl
www.sieporobilo.acubenes.net
89.191.137.71/imgalery/
nasze.miasto.wroclaw.pl
www.fotos.czest.pl/IMGallery/
www.ryjek.kko.pl
fot.webd.pl
hemako.pl/IMGallery/
www.mechelinki.eu/Galeria/
parafiamb.pl/imgalery/
www.g2.i365.pl/galeria2/
www.rweit.civ.pl/new/IMGallery/
www.ambasadaclub.pl/ambazory/galeria/
bakom.pl/projekty/
www.pokazylotnicze.pl/galeria/
www.pwg.otop.org.pl/galeria/
|

matches [

# About 2,570,000 results @ 2010-06-27
{:name=>'GHDB: "Powered by IMGallery -exploit"',
:certainty=>75,
:ghdb=>'"Powered by IMGallery" -exploit'
},

{:name=>'powered by text',
:certainty=>100,
:text=>'Powered by <a class = "a07" href="http://www.imgallery.zor.pl"><b>IMGallery</b></a> &copy; Dariusz Niemiec'
},

]

end

