##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TaskFreak" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.1"
description "TaskFreak! Original is a simple but efficient web based task manager written in PHP. - homepage: http://www.taskfreak.com/original/"
examples %w|
demo.taskfreak.com
support.djs-consulting.com
pz-dev.de/tasks/login.php
|

def passive
        m=[]

        if @body =~ /<br>Powered by <a href="http:\/\/www.taskfreak.com">TaskFreak <\/a> v[\d\.]+ - Released on [\d\-]+ under GNU General Public License/
                version=@body.scan(/<br>Powered by <a href="http:\/\/www.taskfreak.com">TaskFreak <\/a> v([\d\.]+) - Released on [\d\-]+ under GNU General Public License/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /    <a href="http:\/\/www.taskfreak.com">TaskFreak! multi user<\/a> v[\d\.]+ - Released on [\d\-]+ under GNU General Public License/
                version=@body.scan(/    <a href="http:\/\/www.taskfreak.com">TaskFreak! multi user<\/a> v([\d\.]+) - Released on [\d\-]+ under GNU General Public License/)[0][0]
                m << {:version=>version}
        end

        m

end


end

