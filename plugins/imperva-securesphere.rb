##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "imperva-securesphere" do
author "Aung Khant <http://yehg.net/>" # 2012-02-12
version "0.1"
description "Imperva SecureSphere - http://www.impervaguard.com/SecureSphere-Platform.asp"



# Matches #
matches [
{:name=>'HTML Body',:text=>'<title>SecureSphere - Default</title>'},
{:name=>'HTML Body',:text=>'<td><font class="gray-text-small">SecureSphere includes software developed by Oracle Corporation.</font></td></tr>'},
{:name=>'HTML Body',:text=>'src="/SecureSphere/scripts/infra/ActiveRequests.js">'},
{:name=>'HTML Body',:text=>'src="/SecureSphere/scripts/infra/Mprv.js"></script>'},
{:name=>'HTML Body',:text=>'src="/SecureSphere/scripts/infra/SessionUtils.js">'},
{:name=>'Location Header', :search=>"headers[location]", :regexp=>/SecureSphere\/secsphLogin\.jsp/}
]

# Aggressive #
def aggressive
	m=[]
	target = URI.join(@base_uri.to_s,'SecureSphere/secsphLogin.jsp').to_s	
	status,url,ip,body,headers=open_target(target)	
	if status == 200

		if body =~ /<td><font class="gray\-text\-small">SecureSphere includes software developed by Oracle Corporation\.<\/font><\/td><\/tr>/
			m << {:name => "HTML Body (CM2)"}
		end

	end

	m
end

end
