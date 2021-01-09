##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Umbraco"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-12
  # v0.2 # Updated matches and version detection. 
  "Chad Brigance @ChadBrigance" # 2021-01-09
]
version "0.3"
description "umbraco is an open source project with roots back to year 2000 even though it wasn't released as open source until 2004."
website "http://www.umbraco.org"

# About 24,400 results for "powered by umbraco" @ 2010-06-08
# 27 results for "site powered by umbraco" @ 2010-06-08
# 17 results for "site powered by umbraco v4" @ 2010-06-08

# Dorks #
dorks [
'"site powered by umbraco"'
]



matches [

# GHDB Match
{ :ghdb=>'"powered by umbraco"', :certainty=>25 },

# Meta generator
{ :text=>'<meta name="generator" content="umbraco" />' },

# Powered by text
{ :regexp=>/Powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>Umbraco<\/a>/i },

# Version detection # Powered by text
{ :version=>/powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>umbraco v([^<]+)<\/a>/i },

# Version detection # Powered by text # 4.x
{ :regexp=>/powered by[^<]*<a[\s]+href="http:\/\/[www.]*umbraco.org[^>]*>umbraco v4<\/a>/i, :version=>"4.x" },

# Version detection # Meta generator
{ :version=>/<meta name="generator"[^>]*content="umbraco[\s]+([0-9\.]+)"/i },

# CSS Starter Kit
{ :regexp=>/<link rel="stylesheet"[^>]*href="\/css\/umbraco-starterkit-style\.css"/i },

# Javascript Starter Kit
{ :regexp=>/<script src="\/scripts\/umbraco-starterkit-app.js"/i },

# Admin panel Umbraco Title
{ :url=>'/umbraco', :ghdb=>'intitle:Umbraco' },

# Admin panel
{ :url=>'/umbraco', :text=>'<p>For full functionality of Umbraco CMS it is necessary to enable JavaScript.</p>', :name=>'Admin Page' },

# Umbraco logo MD5 match - seen in the official release package for 7.x and 8.x versions
{ :url=>'/umbraco/assets/img/application/logo.png', :md5=>'b7dcca0229da530204697a309c7e6593' },

# Version Detection # init.js MD5
{ :url=>'/umbraco/Js/init.js', :md5=>'12dc01120ea19b0db5f981ea4d7a134a', :version=>"7.0.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'a8d0f352eef9f8da4610a7abfff01693', :version=>"7.0.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'a8d0f352eef9f8da4610a7abfff01693', :version=>"7.0.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'ea82db1c04318f6075d180f02f04cbea', :version=>"7.0.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'ea82db1c04318f6075d180f02f04cbea', :version=>"7.0.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.8" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.1.9" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.2.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.2.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.2.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.2.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'0512c3984930ff6b553b07aa7737ec36', :version=>"7.2.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'783708e9626a54548a9600e163a8e2b7', :version=>"7.2.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'783708e9626a54548a9600e163a8e2b7', :version=>"7.2.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'783708e9626a54548a9600e163a8e2b7', :version=>"7.2.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'783708e9626a54548a9600e163a8e2b7', :version=>"7.2.8" },
{ :url=>'/umbraco/Js/init.js', :md5=>'783708e9626a54548a9600e163a8e2b7', :version=>"7.2.9" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'873f489d6470ec9be4558e42d5debd9d', :version=>"7.3.8" },
{ :url=>'/umbraco/Js/init.js', :md5=>'783708e9626a54548a9600e163a8e2b7', :version=>"7.3.9" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.4.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.4.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.4.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.4.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b1078fdbe352ce2c92cd2e39ccbd75b8', :version=>"7.4.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'37e4e0d14041c58eb32f6e9b8ae28b32', :version=>"7.5.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'24d9de7281006d487eccd4e022c4bfec', :version=>"7.5.8" },
{ :url=>'/umbraco/Js/init.js', :md5=>'1b7ac68ca02ee11f9be5b3ed3aa7b39d', :version=>"7.5.9" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2e4f67fbfdad227d58d309ac16fe36a9', :version=>"7.6.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2e4f67fbfdad227d58d309ac16fe36a9', :version=>"7.6.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2e4f67fbfdad227d58d309ac16fe36a9', :version=>"7.6.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2e4f67fbfdad227d58d309ac16fe36a9', :version=>"7.6.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2e4f67fbfdad227d58d309ac16fe36a9', :version=>"7.6.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2e4f67fbfdad227d58d309ac16fe36a9', :version=>"7.6.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'f487eab7bc1e30f9bf88c1e1de3c3922', :version=>"7.6.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'07c4032b50b59670094b6b9b0b3ed8fb', :version=>"7.6.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'07c4032b50b59670094b6b9b0b3ed8fb', :version=>"7.6.8" },
{ :url=>'/umbraco/Js/init.js', :md5=>'07c4032b50b59670094b6b9b0b3ed8fb', :version=>"7.6.9" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.8" },
{ :url=>'/umbraco/Js/init.js', :md5=>'660f0c4b79da9f8539022d44e51f0008', :version=>"7.7.9" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.8.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.8.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.8.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.8.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.8.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'b92f32bfadef2cc7c0bf3492c87a64a1', :version=>"7.9.7" },
{ :url=>'/umbraco/Js/init.js', :md5=>'2b2680e180639be67d09c78543a2f8f2', :version=>"7.15.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5f30cd18037d928894d0ddc7641c5c16', :version=>"8.0.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5f30cd18037d928894d0ddc7641c5c16', :version=>"8.0.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5f30cd18037d928894d0ddc7641c5c16', :version=>"8.0.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5f30cd18037d928894d0ddc7641c5c16', :version=>"8.0.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.1.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'4f10cdac49fab3b4f6b6237d4c53de12', :version=>"8.2.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5ec593d59aafee74df11981f5922c805', :version=>"8.2.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5ec593d59aafee74df11981f5922c805', :version=>"8.2.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5ec593d59aafee74df11981f5922c805', :version=>"8.2.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5ec593d59aafee74df11981f5922c805', :version=>"8.3.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'5ec593d59aafee74df11981f5922c805', :version=>"8.3.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.4.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.4.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.4.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.5.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.5.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.5.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.5.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.5.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'9bcb66a57f3924eba933a278e8276cd8', :version=>"8.5.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.3" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.4" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.5" },
{ :url=>'/umbraco/Js/init.js', :md5=>'04349358d1a040fdb44a039e14f95306', :version=>"8.6.6" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.7.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.7.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.8.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.8.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.8.2" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.9.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.9.1" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.10.0" },
{ :url=>'/umbraco/Js/init.js', :md5=>'31e12ee0679dfb1a9b242e6b74fdbf58', :version=>"8.10.1" },

]

end
