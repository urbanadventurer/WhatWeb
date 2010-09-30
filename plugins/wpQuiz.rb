##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "wpQuiz" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.1"
description "wpQuiz is a fully-featured quiz script. - homepage: http://www.wireplastik.com/"

# 42 results for "powered by wpQuiz" intitle:"Register - wpQuiz" inurl:register.php @ 2010-08-21
examples %w|
vcp.madpage.com/register.php
quiz.potterharry.net/test/register.php
toets.rioned.org/register.php
loxiiquiz.site50.net/register.php
fcpf.locais.net/teste/upload/register.php
bervoetsinfo.comli.com/Quizz/register.php
bio-geek.com/RaceMgt/register.php
siptrainer.mcw-portal.com/register.php
www.internationaltradetraining.org/wpquiz/register.php
www.brunopelosi.it/alunni/wpquiz/quiz/upload/register.php
www.krupranee.com/test/register.php
www.englishclub-bg.org/quiz/upload/register.php
www.lukjagla.eu/fizyka/upload/register.php
www.zsel.pl/ezawodowy/register.php
www.zso2.kartuzy.pl/wpquiz/register.php
www.pip.gov.pl/quiz/upload/register.php
www.nu-rave.pl/register.php
www.dimensionepesca.com/wpquiz/register.php
www.autoscuola-online.it/quiz/register.php
www.support4y.com/quiz/register.php
www.doma.webd.pl/wpquiz/register.php
www.vlo.poznan.pl/~lidkawoj/ofek/testy/register.php
turniejeonline.freehostia.com/register.php
zse.zsel.pl/ezawodowy/register.php
|

matches [

{ :regexp=>/<title>[^>]*>> [Register|Login]+ - wp[q|Q]+uiz<\/title>/ },
{ :text=>"<div class='small' style='text-align: center;'>Powered by wpQuiz</div>
" },

]

def passive
        m=[]

        if @body =~ /<span class='big'><b><img src='img\/mainlogo.png' alt='[^\']+' \/> [\d\.a-z]+<\/b><\/span>/
                version=@body.scan(/<span class='big'><b><img src='img\/mainlogo.png' alt='[^\']+' \/> ([\d\.a-z]+)<\/b><\/span>/)[0][0]
                m << {:version=>version}
        end

	if @body =~ /<img src="http:\/\/www.wireplastik.com\/wplog.php\?al=/
		if @body =~ /[\d\.a-z]+ \| [0-9]+ Template/
			version=@body.scan(/([\d\.a-z]+) \| [0-9]+ Template/)[0][0]
			m << {:version=>version}
		end
	end

        m

end


end

