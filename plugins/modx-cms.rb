##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# remove :name & :certainty

Plugin.define "ModxCMS" do
  author "Andrew Horton"
  version "0.2"
  description "OpenSource CMS written in PHP."
  website "http://modxcms.com/"
  
   
    
    # none of this is common
    #www.soteapparel.com-.html:        <script type="text/javascript">var MODX_MEDIA_PATH = "media";</script>
    #www.techsolcom.ca-en-.html: <meta name="version" content="MODx 0.9.6.2-rc1 (rev 3741)" />
    #www.indieophile.com-.html:<li>powered by <a href="http://www.modxcms.com" title="modx cms">mod<strong>x</strong></a></li>
    #www.filieo.com-.html:	<meta name="generator" content="ModX" />
    
    
    matches [
             {:text=>'<meta name="generator" content="ModX'},
             {:text=>'<script type="text/javascript">var MODX_MEDIA_PATH'}
            ]
  
  # these cookies and p3p are fairly reliable
  # two diff lengths. version change?
  #Set-Cookie: SN489f661741c15=33puk0t1j8rjeulorh70m73b52; path=/
  #Set-Cookie: SN484d726774858=f0f40f14fbddeaead360a77ccb006365; path=/
  # P3P: CP="NOI NID ADMa OUR IND UNI COM NAV"
  
  
  # Aggressive #
  def aggressive
    m = []

    versions = Hash[
                    "2.0.3" =>
                    [["manager/assets/modext/modext-min.js",
                      "86f8fee216d77361445b076eee0d8ce9"],
                     ["core/docs/changelog.txt",
                      "920ffe99f17c744263a02b29adee2e28"]],
                    "2.0.4" =>
                    [["manager/assets/modext/modext-min.js",
                      "8b4ee02134c611a666489dd0fdadf265"],
                     ["core/docs/changelog.txt",
                      "fce973b404e36a3cc8bbdf94a946737c"]],
                    "2.0.5" =>
                    [["manager/assets/modext/modext-min.js",
                      "5cdab4d3899a66916b46c638bd150c76"],
                     ["core/docs/changelog.txt",
                      "7644749c62603a7a5619642e6bc57600"]],
                    "2.0.6" =>
                    [["manager/assets/modext/modext-min.js",
                      "2e280134a1ae86247724f34dc6d60236"],
                     ["core/docs/changelog.txt",
                      "8b3ec45b4dce777b48d0114dfe96fd94"]],
                    "2.0.7" =>
                    [["manager/assets/modext/modext.js",
                      "f9027bb32f3dd0998b8ee3cf0d5b7361"],
                     ["core/docs/changelog.txt",
                      "8520c8e49ea017360144e0c3f4f91e86"]],
                    "2.0.8" =>
                    [["manager/assets/modext/modext.js",
                      "f9027bb32f3dd0998b8ee3cf0d5b7361"],
                     ["core/docs/changelog.txt",
                      "e89edac9e31ab89905c072c47bae17e1"]],
                    "2.1.0" =>
                    [["manager/assets/modext/modext-min.js",
                      "f23ea06c3eec2b89d99fc54ca3af428d"],
                     ["core/docs/changelog.txt",
                      "7d71a44c4b49e4a0f481ef84e0405669"]],
                    "2.1.1" =>
                    [["manager/assets/modext/modext-min.js",
                      "0302338b5bb47dd6f3d3738d20ed8c3c"],
                     ["core/docs/changelog.txt",
                      "f61372409f3039743b2f29c35d2f83e3"]],
                    "2.1.2" =>
                    [["manager/assets/modext/modext-min.js",
                      "45a33a90b0d3dc6596ee3e62f3ef64eb"],
                     ["core/docs/changelog.txt",
                      "40701196368b75420395ac1dfc13e9fc"]],
                    "2.1.3" =>
                    [["manager/assets/modext/modext-min.js",
                      "54df522cd0d54b8549d8232307af3798"],
                     ["core/docs/changelog.txt",
                      "ab89eb4f3222973b329d378259f9db16"]],
                    "2.1.4" =>
                    [["manager/templates/default/css/index.css",
                      "78c5e4714c4e98175c52ff12ff63ac3e"],
                     ["core/docs/changelog.txt",
                      "87cf61141b7c2ef763743d2f2ba44187"]],
                    "2.1.5" =>
                    [["manager/templates/default/css/index.css",
                      "78c5e4714c4e98175c52ff12ff63ac3e"],
                     ["core/docs/changelog.txt",
                      "61d525805729cc2be1a07eb0d7dec244"]],
                    "2.2.0" =>
                    [["manager/templates/default/css/index.css",
                      "1eb05036b0068f3f36da8bbb18d73d5d"],
                     ["core/docs/changelog.txt",
                      "4962b05952b8cc224b1b317946776311"]],
                    "2.2.1" =>
                    [["manager/templates/default/css/index.css",
                      "d41a32696eb76dab493d93d8155380dd"],
                     ["core/docs/changelog.txt",
                      "bc3917f4eee4c0544e0bce1c32dd444e"]],
                    "2.2.2" =>
                    [["manager/assets/modext/widgets/resource/modx.tree.resource.js",
                      "b0bd484735fc96cd0f4bea8545903b16"],
                     ["manager/assets/modext/widgets/resource/modx.tree.resource.js",
                      "b0bd484735fc96cd0f4bea8545903b16"],
                     ["core/docs/changelog.txt",
                      "d82c3a3548c2cd3b769a53cc947778ff"]],
                    "2.2.3" =>
                    [["manager/assets/modext/widgets/resource/modx.tree.resource.js",
                      "2d1440f2ec29e75331c3fc5053e6e379"],
                     ["manager/templates/default/css/index.css",
                      "b45efe3d48aa27a7742a219b789aac9b"],
                     ["core/docs/changelog.txt",
                      "4ec62030eeb9926a29910ce2a5eaacf7"]],
                    "2.2.4" =>
                    [["manager/assets/modext/widgets/resource/modx.tree.resource.js",
                      "2d1440f2ec29e75331c3fc5053e6e379"],
                     ["manager/templates/default/css/index.css",
                      "b45efe3d48aa27a7742a219b789aac9b"],
                     ["core/docs/changelog.txt",
                      "154cac2314bff5de6970eeb7c2552e79"]],
                    
                    
                    "2.0.3-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "81e2a566229564cf477ba706b0769aa3"],
                     ["core/docs/changelog.txt",
                      "920ffe99f17c744263a02b29adee2e28"]],
                    "2.0.4-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "832d2c5c4bf8de80c6a3f60c8e4a230f"],
                     ["core/docs/changelog.txt",
                      "fce973b404e36a3cc8bbdf94a946737c"]],
                    "2.0.5-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "434e43d0cc0d22d56e1e02dbb6a5201b"],
                     ["core/docs/changelog.txt",
                      "7644749c62603a7a5619642e6bc57600"]],
                    "2.0.6-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "12c0b38e75cf9b4cd8c6180e5fc22678"],
                     ["core/docs/changelog.txt",
                      "8b3ec45b4dce777b48d0114dfe96fd94"]],
                    "2.0.7-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "12c0b38e75cf9b4cd8c6180e5fc22678"],
                     ["core/docs/changelog.txt",
                      "8520c8e49ea017360144e0c3f4f91e86"]],
                    "2.0.8-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "12c0b38e75cf9b4cd8c6180e5fc22678"],
                     ["core/docs/changelog.txt",
                      "e89edac9e31ab89905c072c47bae17e1"]],
                    "2.1.0-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "072facc9e04761cbac5c7f297276c76b"],
                     ["core/docs/changelog.txt",
                      "7d71a44c4b49e4a0f481ef84e0405669"]],
                    "2.1.1-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "072facc9e04761cbac5c7f297276c76b"],
                     ["core/docs/changelog.txt",
                      "f61372409f3039743b2f29c35d2f83e3"]],
                    "2.1.2-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "a2503de105486f2689bf3b6ca31eb76f"],
                     ["core/docs/changelog.txt",
                      "40701196368b75420395ac1dfc13e9fc"]],
                    "2.1.3-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "a2503de105486f2689bf3b6ca31eb76f"],
                     ["core/docs/changelog.txt",
                      "ab89eb4f3222973b329d378259f9db16"]],
                    "2.1.4-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "7f4a2e430ebe2ffd62faefe0a92016db"],
                     ["core/docs/changelog.txt",
                      "87cf61141b7c2ef763743d2f2ba44187"]],
                    "2.1.5-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "7f4a2e430ebe2ffd62faefe0a92016db"],
                     ["core/docs/changelog.txt",
                      "61d525805729cc2be1a07eb0d7dec244"]],
                    "2.2.0-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "729ca300187abf743afebc2fd84be4a6"],
                     ["core/docs/changelog.txt",
                      "4962b05952b8cc224b1b317946776311"]],
                    "2.2.1-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "0b2fda1e925d605c498b3955db887825"],
                     ["core/docs/changelog.txt",
                      "bc3917f4eee4c0544e0bce1c32dd444e"]],
                    "2.2.2-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "141d091785d92289583682e556858c41"],
                     ["core/docs/changelog.txt",
                      "d82c3a3548c2cd3b769a53cc947778ff"]],
                    "2.2.3-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "141d091785d92289583682e556858c41"],
                     ["core/docs/changelog.txt",
                      "4ec62030eeb9926a29910ce2a5eaacf7"]],
                    "2.2.4-advanced" =>
                    [["core/model/schema/modx.mysql.schema.xml",
                      "141d091785d92289583682e556858c41"],
                     ["core/docs/changelog.txt",
                      "154cac2314bff5de6970eeb7c2552e79"]]

                   ]
    
    v = Version.new("Modx", versions, @base_uri)
    
    version = v.matches_format
    
    # Return version matches from md5 hashes, if present
    unless version.empty?
        version.each { |ver|
            m << {:name => "MD5 sums", :version => ver}
        }
    end	
    m
  end

  def passive
    m=[]
    m << {:name=>"SN4 Cookie", :certainty=>75 } if @headers["set-cookie"] =~ /^SN4[a-z0-9]{12}=/
    m << {:name=>"P3P" } if @headers["P3P"] =~ /CP="NOI NID ADMa OUR IND UNI COM NAV"/
    
    m
  end

  # /manager page contains :
  #<a href="http://modxcms.com/" target="_blank">MODx CMF Team</a>

end

