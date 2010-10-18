##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Glossword" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.1"
description "Glossword helps you to create and publish online multilingual dictionary, glossary, or reference. - homepage: http://glossword.biz/"

# 120 results for "Powered by Glossword" @ 2010-08-01
examples %w|
65.254.78.72/php/glossword/
abbrevs.com
almoltaka.net/glossword/
armenian.name
bfme2.heavengames.com/php/glossword/
canaanite.org/dictionary/
chinese.cnx-translation.com/dictionary/
codewit.com/glossword/
culinary.expressionz.in/glossary/
data-safe.us/mysticknowing/dictionary/
definemore.com/glossword/
denizo.opia.dk/pelikano/
healthglossary.info
independent-adjuster.com/glossword/
kiyoeri.gotdns.com:8089/glw/
klingon.net46.net/glossword/1.8/
lawyerencyclopedia.com
lingwadeplaneta.info/glossword/
managementglossary.info
neologisms.rice.edu
oilylawyer.com
reference.animeworld.com
sapadvice.com/list/
saptutorial.com/list/
tamilenglishdictionary.com
techglossary.info
wachanakoshaya.co.cc
www.africaservice.com/dictionary/
www.agelock.ro/max-dictionary-online/
www.allindustrialresources.com
www.beard-bear.com/glossword/
www.bolden.ru/glossary/glossword/1.8/
www.cnx-translation.com/thaidict/
www.competencesoftware.net/glossword/
www.constantineau.ca/glossaire/
www.cybermotorcycle.com/glossword/1.8/
www.dailyspanishword.com
www.docinfos.com/glossword/
www.fastrad.com.br/glossword/
www.forexglossary.com
www.gaxan.net/ferheng/
www.haverhillrfc.co.uk
www.ixl.ru/index.php
www.kazakhtili.com
www.kuark.org/terim/
www.marketing-playbook.com/glossary/
www.memhr.org/dic/
www.miguelmllop.com/gw/
www.nplg.gov.ge/glossword/
www.odps.org/glossword/
www.rare-cancer.org/dictionary/
www.rfcmd.ru/glossword/1.8/
www.stradablu.com/Dictionary/
www.swahili.it/glossword/
www.thespeechsite.com/php/glossword/
www.wergerine.com/ferheng/
www.whytea.net/glossword/1.8/
www.wikapinoy.com/glossary/
www.wingeo.org/lexicon/
|

# Version detection
def passive
        m=[]

        # Meta generator
        if @body =~ /<meta name="generator" content="Glossword version [\d\.\-a-z]+" \/>/
                version=@body.scan(/<meta name="generator" content="Glossword version ([\d\.\-a-z]+)" \/>/)[0][0]
                m << {:version=>version}
        elsif @body =~ /<meta content="Glossword version [\d\.\-a-z]+" name="generator" \/>/
                version=@body.scan(/<meta content="Glossword version ([\d\.\-a-z]+)" name="generator" \/>/)[0][0]
                m << {:version=>version}
        end

        # Powered by text
        if @body =~ /<p>Powered by <a href="http:\/\/glossword.info\/" style="text-decoration:underline">Glossword<\/a> [\d\.]+<\/p>/
                version=@body.scan(/<p>Powered by <a href="http:\/\/glossword.info\/" style="text-decoration:underline">Glossword<\/a> ([\d\.]+)<\/p>/)[0][0]
                m << {:version=>version}
        end

        m

end


end

