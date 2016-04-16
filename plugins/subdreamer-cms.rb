##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Subdreamer-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15 
version "0.1"
description "Whether your goal is creating a simple or full scale website, Subdreamer will get you there by providing unbeatable content management tools."
website "http://www.subdreamer.com/"


matches [

# "powered by Subdreamer CMS"
# about 1,020,000 results @ 2010-06-15
# "website powered by Subdreamer CMS"
# 990,000 results @ 2010-06-15
{:name=>'GHDB: "powered by Subdreamer CMS"',
:certainty=>75,
:ghdb=>'"powered by Subdreamer CMS"'
},

# <div class="copyright"> Website powered by Subdreamer CMS</div>
# <a href="http://www.subdreamer.com/" title="Website powered by Subdreamer CMS">Website powered by Subdreamer CMS</a>
# <a href="http://www.subdreamer.com" target="_blank" class="copyright">Website powered by Subdreamer CMS</a><br />
# <a href="http://www.subdreamer.com" title="Website powered by Subdreamer">Website powered by Subdreamer</a>
# <td class="logintitle" height="18">Subdreamer Admin Panel</td>
# <div id="copyright">Powered by <b>Subdreamer CMS</b></div>

{:name=>"powered by text #1",
:certainty=>100,
:text=>'<a href="http://www.subdreamer.com" target="_blank" class="copyright">Website powered by Subdreamer CMS</a>'
},

{:name=>"powered by text #2",
:certainty=>100,
:regexp=>/<a href="http:\/\/www.subdreamer.com[\/]*" title="Website powered by Subdreamer[\ CMS]*">Website powered by Subdreamer[\ CMS]*<\/a>/
},

{:name=>"login page text",
:certainty=>100,
:text=>'<div id="copyright">Powered by <b>Subdreamer CMS</b></div>'
},

{:name=>"old login page text",
:certainty=>100,
:text=>'<td class="logintitle" height="18">Subdreamer Admin Panel</td>'
}

]

def passive
        m=[]
        m << {:name=>"sdsessionid Cookie" } if @headers["set-cookie"] =~ /sdsessionid=[a-z0-9]{32}/
	m
end

end

# an aggresive plugin can get the version from unsecured admin panels
# <div>Powered by <b>Subdreamer 3.0.0</b>
# http://www.subdreamer.com/demo/admin/

