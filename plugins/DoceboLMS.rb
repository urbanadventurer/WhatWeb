##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DoceboLMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-24
version "0.1"
description "DoceboLMS is a SCORM compliant Open Source e-Learning platform used in corporate, government and education markets. - Homepage: http://www.docebo.org/doceboCms/index.php"

# Google results as at  2011-03-24 #
# 253 for "Powered by Docebo"

# Examples #
examples %w|
demo.docebo.org
asp.docebo.com
devel.docebo.com
training.wellnessinstitute.com
www.tulipu.com
mplearning.org
www.idhs.co.cc
pcourse.co.cc
www.uselli.it/d4b/
www.communitysafetyprofessionals.com/learning/
www.hamst7oob.com/study/
techniquelearning.net
www.frts-elearning.com
ttaelearn.com
docebo40.docebo.info
www.giuseppeamenta.it/docebo4/
www.teotawki.org
campus.peacetour.org
www.esotericeducation.org
www.microbiologystudents.com/BMS_campus/
ecollege24.com
lms4.do-learning.com
phteamsite.org
erudinet.com
www.activeelearning.com/docebolms/index.php
www.bee-safe.dk
lms.iaccglobal.com
www.digitaaltrainen.nl
www.lascuolasulweb.it/index.php
www.tanvisoft.com/courses/index.php
www.lms.magusict.net/index.php
tracyatisdale.com/docebo/
eap.panagiotakos.net/
www.pic.edu.ph/myeClassroom/
lnx.matefilia.it/docebo/
academy.icris.nl
www.ubaldogulotta.eu/docebo/
chillzee.in
www.auxiliarenenfermeria.com/docebo4/
www.vasfitugun.net
aulavirtualgirona.org
www.e-unisob.it
www.itas.co.za/docebo/doceboCore/
avogadro.fauser.edu/admin.php
|

# Matches #
matches [

# Powered by link
{ :text=>'Powered by <a href="http://www.docebo.com/?versions" onclick="window.open(this.href); return false;">Docebo <sup>&reg;</sup></a>' },

# Powered by link # "." matches unencoded (R) symbols which fail in regex
{ :regexp=>/<div class="powered"><a href="http:\/\/www.docebo.com\/\?[a-z]+" target="_blank" alt="Powered by Docebo ." title="Powered by Docebo .">Powered by Docebo .<\/a><\/div>/ },

# Version Detection # Title
{ :certainty=>25, :version=>/<title>DoceboCore ([\d\.]+)<\/title>/ },

# Version Detection # Powered by text
{ :version=>/Powered by Docebo <sup>&reg;<\/sup> (Community|Enterprise) Edition/ },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/www\.docebo\.com\/\?versions" onclick="window\.open\(this\.href\); return false;">Docebo <sup>&reg;<\/sup> (Community|Enterprise) Edition<\/a>/ },

# JavaScript
{ :text=>'lang_setup.setBody("<ul class=\"link_list_inline\" id=\"language_selection\"><li><a class=\"lang-sprite lang_' },

]

# Passive #
def passive
	m=[]

	# Version Detection # Install Page # Title and h1 heading
	if @body =~ /<title>Docebo installer<\/title>/ and @body =~ /<h1>Docebo ([\d\.]+) - Installation<\/h1>/
		m << { :string=>"Install Page", :version=>@body.scan(/<h1>Docebo ([\d\.]+) - Installation<\/h1>/) }
	end 

	# Return passive matches
	m
end

end


