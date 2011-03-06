##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "vTigerCRM" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "vTigerCRM - http://www.vtiger.com/"

examples %w|
http://demo.vtiger.com/
http://demo.vtiger.de/
http://demo.myvtiger.it/
http://demo.vhostr.com/
http://demo.vtiger-crm.cz/
http://www.portalondemand.biz/demo/vtigercrm52/
http://demo.vtiger.pl/
http://planetauthorize.com/vtiger52demo/
http://demo.m8solutions.com/vtigercrm/
http://demo.devsum.it/vtiger/
http://www.magestore.com/demo/vtiger/
http://openwebapplications.com/crmdemo/
|


matches [

{ :name=>'favicon md5', :url=>'/themes/images/vtigercrm_icon.ico',:md5=>'d90cc1762bf724db71d6df86effab63c'},

{ :name=>'favicon md5', :url=>'/include/images/vtigercrm_icon.ico',:md5=>'d90cc1762bf724db71d6df86effab63c'},

{ :name=>'stats img', :text=>'<img src=\'http://stats.vtiger.com/stats.php?uid=' },

{ :version => /<span style='color: rgb\([\d]{1,3}, [\d]{1,3}, [\d]{1,3}\);'>vtiger CRM ([^<]*)<\/span>/},

{ :name=>'copyright footer', :regexp => /&copy; 200[\d]{1}\-\d{4} <a href='http:\/\/www.vtiger.com' target='_blank'>vtiger.com<\/a>/},

{ :name=>'html body favicon', :text=>'/vtigercrm_icon.ico">'}

]


end


