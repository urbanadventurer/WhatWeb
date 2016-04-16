##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb

# Vesion 0.8 # Andrew
#  Added aggressive match for /administrator/. Use match now
##
# Version 0.7 # 2011-03-19 # Brendan Coles <bcoles@gmail.com>
# Added aggressive match for /administrator/
# Updated matches to remove false positives
##
# Version 0.6
# added seconds since epoch match from the mambo plugin
##
# Version 0.5
# uses :module instead of :string, changed the 3rd regexp from 75 certainty to 25.
##
# Version 0.4
# removed :probability & :name
##
Plugin.define "Joomla" do
  author "Andrew Horton"
  version "0.7"
  description "Opensource CMS written in PHP. Aggressive version detection compares just 5 files, valid for versions 1.5.0-1.5.22 and 1.6.0-1.6.1."
  website "http://joomla.org"
  
  # Google results as at 2011-03-19 #
  # 602 for "powered by joomla" inurl:option=com_content
  # 537 for "powered by joomla"
  
  # Dorks #
  dorks [
         '"powered by joomla" inurl:option=com_content'
        ]
  
# Matches #
    matches [
             { :version=>"1.0", :regexp=>/<meta name="Generator" content="Joomla! - Copyright \(C\) 200[0-9] - 200[0-9] Open Source Matters. All rights reserved." \/>/ },
             { :version=>/<meta name="generator" content="Joomla! (\d\.\d) - Open Source Content Management" \/>/ },
             { :text=>'Powered by <a href="http://www.joomla.org">Joomla!</a>.' },
             
             { :url=>'/administrator/', :regexp=>/<div id="joomla"><img src="[^"]*\/images\/header_text.png" alt="Joomla! Logo"/ , :name=>'admin page'} #"
            ]
   
  # Passive #
  def passive
    m=[]
    
    # mosvisitor cookie # Also used by mambo
    m << { :certainty=>75, :name=>"mosvisitor cookie" } if @headers["set-cookie"] =~ /mosvisitor=[0-9]+/ 
    
    # P3P Privacy Headers # Also used by phpcake
    m << { :name=>"P3P Privacy Headers", :certainty=>25 } if @headers["p3p"] == 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'
    
    # HTML Comment # seconds since epoch # Also used by mambo
    if @body =~ /<\/html>.*(\n)*<!-- [0-9]+.*-->(\n)*\z/ and @body !~ /mambo/i
      m << {:name=>"seconds since epoch in html comment after </html>",:certainty=>25}
    end
    
    
    # Module Detection # Doesn't work in SEO mode # Also used by mambo
    if @body =~ /<a href="[^"]*index.php\?option=(com_[^&^"]+)/
      
      # Absolute URL
      m << { :certainty=>75, :module=>@body.scan(/<a href="https?:\/\/#{Regexp.escape(@base_uri.host)}[^"]*index.php\?option=(com_[^&^"]+)/) } if @body =~ /<a href="https?:\/\/#{Regexp.escape(@base_uri.host)}[^"]*index.php\?option=(com_[^&^"]+)/
      
      # Relative URL
      m << { :certainty=>75, :module=>@body.scan(/<a href="[^"^:]*index.php\?option=(com_[^&^"]+)/) } if @body =~ /<a href="[^"^:]*index.php\?option=(com_[^&^"]+)/
      
    end
    
    
    # Return passive matches
    m
  end
  
  # Aggressive #
  def aggressive
    m=[]
    
    versions = Hash["1.0.0" =>
                    [["mambots/editors/tinymce.xml",
                      "edefdf03134820ce7c70c5259efb9933"]],
                    "1.0.1" =>
                    [["mambots/editors/tinymce.xml",
                      "413b5585e4a4eae68c1a84d46e6df39b"]],
                    "1.0.2" =>
                    [["htaccess.txt",
                      "afb2e4330fdd3ce1fc3a177c699500c9"]],
                    "1.0.3" =>
                    [["htaccess.txt",
                      "e8225db1325ec0881f6c35ba1d8cf3d3"]],
                    "1.0.4" =>
                    [["administrator/images/install.png",
                      "98781b97253bf4f08717dcace0f18f5e"]],
                    "1.0.5" =>
                    [["administrator/images/install.png",
                      "49fad9c07d820e7a4c9a1ce181a1facd"],
                     ["htaccess.txt",
                      "5e5b5d8a7eead9c108bb9f20731c545f"]],
                    "1.0.6" =>
                    [["administrator/images/install.png",
                      "49fad9c07d820e7a4c9a1ce181a1facd"],
                     ["htaccess.txt",
                      "e4ddb334509c5c68c4f79e98e9b74730"]],
                    "1.0.7" =>
                    [["administrator/images/install.png",
                      "49fad9c07d820e7a4c9a1ce181a1facd"],
                     ["htaccess.txt",
                      "e4ddb334509c5c68c4f79e98e9b74730"]],
                    "1.0.8" =>
                    [["htaccess.txt",
                      "9a31c03b78bc47c924f6cf70ca60aa5f"],
                     ["mambots/editors/tinymce.xml",
                      "083dd5a6b123ad25c9f69a9eef0cf2df"]],
                    "1.0.9" =>
                    [["htaccess.txt",
                      "9a31c03b78bc47c924f6cf70ca60aa5f"],
                     ["mambots/editors/tinymce.xml",
                      "b13ea8e0725f7c2053667304dea193bf"]],
                    "1.0.10" =>
                    [["htaccess.txt",
                      "f363429837881dc1ec847c0f45729b71"]],
                    "1.0.11" =>
                    [["htaccess.txt",
                      "a5e00265b1f46438dbe005fe052edd99"]],
                    "1.0.12" =>
                    [["htaccess.txt",
                      "2dc67316e261bb45d11262e78942feeb"]],
                    "1.0.13" =>
                    [["modules/mod_wrapper.xml",
                      "4cbbbc7782a23a811a462a62a699be2d"]],
                    "1.0.14-rc1" =>
                    [["modules/mod_wrapper.xml",
                      "1ecb889511e8b878b42e8cef476b5d3b"]],
                    "1.0.14" =>
                    [["htaccess.txt",
                      "aacd62b8919a1081ab954d7062affb0f"],
                     ["administrator/images/install.png",
                      "49fad9c07d820e7a4c9a1ce181a1facd"],
                     ["administrator/modules/mod_components.xml",
                      "0b5554f8f2da6df6b7d979d0042c7fbf"],
                     ["mambots/editors/tinymce.xml",
                      "679c382f2ae3f8fb4056f09bd0014e89"]],
                    "1.0.15" =>
                    [["htaccess.txt",
                      "aacd62b8919a1081ab954d7062affb0f"],
                     ["administrator/images/install.png",
                      "49fad9c07d820e7a4c9a1ce181a1facd"],
                     ["administrator/modules/mod_components.xml",
                      "0b5554f8f2da6df6b7d979d0042c7fbf"],
                     ["mambots/editors/tinymce.xml",
                      "679c382f2ae3f8fb4056f09bd0014e89"]],
                    
                    "1.5.0" =>
                    [["language/en-GB/en-GB.ini",
                      "903fb75f4369d78373b7b00db1c86c20"]],
                    "1.5.1" =>
                    [["language/en-GB/en-GB.ini",
                      "be9408d25f37e91111caefca9b07f7d9"]],
                    "1.5.2" =>
                    [["language/en-GB/en-GB.ini",
                      "630486389fb8b81bd17417acdf82534d"]],
                    "1.5.3" =>
                    [["language/en-GB/en-GB.ini",
                      "7ce67c338528faac3870827d439daa8e"]],
                    "1.5.4" =>
                    [["administrator/language/en-GB/en-GB.ini",
                      "d7961bdd2528bf4bfc505b1d44920edd"],
                     ["language/en-GB/en-GB.ini",
                      "18bcc3be286f5c9ee03b211c3fcc02f6"]],
                    "1.5.5" =>
                    [["administrator/language/en-GB/en-GB.ini",
                      "36a0b9af0fb86d84f51d2cfeef7577e8"],
                     ["components/com_content/views/section/tmpl/blog.xml",
                      "1c7734da60b28b44d7cb64ca5438c385"]],
                    "1.5.6" =>
                    [["administrator/language/en-GB/en-GB.ini",
                      "36a0b9af0fb86d84f51d2cfeef7577e8"],
                     ["components/com_content/views/section/tmpl/blog.xml",
                      "1c7734da60b28b44d7cb64ca5438c385"]],
                    "1.5.7" =>
                    [["administrator/language/en-GB/en-GB.ini",
                     "36a0b9af0fb86d84f51d2cfeef7577e8"],
                    ["components/com_content/views/section/tmpl/blog.xml",
                     "898b11ae86668024a3c4d64a52f86173"]],
                    "1.5.8" =>
                    [["language/en-GB/en-GB.ini",
                      "fb5fcb1739656a7056573a1f04feb294"]],
                    "1.5.9" =>
                    [["administrator/language/en-GB/en-GB.ini",
                      "5516cf074a67bb54bbdb4fd9c340574d"]],
                    "1.5.10" =>
                    [["administrator/language/en-GB/en-GB.ini",
                      "a8b4a2477bc332f9039828c45aea92c2"]],
                    "1.5.11" =>
                    [["language/en-GB/en-GB.ini",
                      "75586cfdf36020bdbfe66bd90072fb07"],
                     ["administrator/language/en-GB/en-GB.ini",
                      "c42788d652d97e2a103a7dcd3d507789"]],
                    "1.5.12" =>
                    [["plugins/editors/tinymce.xml",
                      "88c25322c0e878b6944cf9ea462c5071"]],
                    "1.5.13" =>
                    [["plugins/editors/tinymce.xml",
                      "e6537f60fc9e6a04eda14d55f852a9d8"]],
                    "1.5.14" =>
                    [["plugins/editors/tinymce.xml",
                      "e6537f60fc9e6a04eda14d55f852a9d8"]],
                    "1.5.15" =>
                    [["language/en-GB/en-GB.ini",
                      "449d7bb356fcefa1343d72d203297438"]],
                    "1.5.16" =>
                    [["administrator/help/helpsites-15.xml",
                      "ab1adf8a00a59bbc5cda0de617de8d48"]],
                    "1.5.17" =>
                    [["language/en-GB/en-GB.ini",
                      "685fdb13400fb459490c72f829427685"]],
                    "1.5.18" =>
                    [["administrator/help/helpsites-15.xml",
                      "0fbcf1a962b227a6626be84cc4a9ebca"],
                     ["components/com_contact/metadata.xml",
                      "9ea9550db4b1ae1eb7af7d7770301d16"]],
                    "1.5.19" =>
                    [["htaccess.txt",
                      "d83c45a3aca4c5e7c8d55def31b6b85d"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.20" =>
                    [["htaccess.txt",
                      "d83c45a3aca4c5e7c8d55def31b6b85d"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.21" =>
                    [["htaccess.txt",
                      "d83c45a3aca4c5e7c8d55def31b6b85d"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.22" =>
                    [["htaccess.txt",
                      "d83c45a3aca4c5e7c8d55def31b6b85d"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.23" =>
                    [["htaccess.txt",
                      "479cce960362b0e17ca26f2c13790087"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.24" =>
                    [["htaccess.txt",
                      "479cce960362b0e17ca26f2c13790087"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.25" =>
                    [["htaccess.txt",
                      "479cce960362b0e17ca26f2c13790087"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],
                    "1.5.26" =>
                    [["htaccess.txt",
                      "479cce960362b0e17ca26f2c13790087"],
                     ["components/com_contact/metadata.xml",
                      "24095af7fbd32685fe2c817544df5117"]],

                    "1.6.0" =>
                    [["joomla.xml",
                      "f1c5fb5aa195e187b7847ddf3b3c492c"]],
                    "1.6.1" =>
                    [["joomla.xml",
                      "57612b39ccefb55c4c4b8f760c4eefaf"]],
                    "1.6.2" =>
                    [["joomla.xml",
                      "bef35a71e39d7a4a7134d9ceb4846fa7"]],
                    "1.6.3" =>
                    [["joomla.xml",
                      "309dbf4fc5906d0dbc74f7b7433ac2b6"]],
                    "1.6.4" =>
                    [["joomla.xml",
                      "08462ef0426bbd37916ea29f0234dc24"]],
                    "1.6.5" =>
                    [["joomla.xml",
                      "37a8957ea7778332251dae4b438f257e"]],
                    "1.6.6" =>
                    [["joomla.xml",
                      "936af8e7615bbc1aecd0181773141f9e"]],

                    "1.7.0" =>
                    [["joomla.xml",
                      "b575e7d089b8bfea19bcc9c7393ccfa1"]],
                    "1.7.1" =>
                    [["joomla.xml",
                      "a76dfb3f5252ec3f07a118e02d83c2ec"]],
                    "1.7.2" =>
                    [["joomla.xml",
                      "5da18d3a7f59874caaa7367238a5bdf2"]],
                    "1.7.3" =>
                    [["joomla.xml",
                      "efa8cae1e299bb85f00bb74cc040a350"]],
                    "1.7.4" =>
                    [["joomla.xml",
                      "f917ce516a76ec3247bb6b0594fa7095"]],
                    "1.7.5" =>
                    [["joomla.xml",
                      "ac25a53c5412bc00cb9b66d5ba657c4d"]],

                    "2.5.0" =>
                    [["joomla.xml",
                      "bab83d5cec8aabbdef29509cef797cc1"]],
                    "2.5.1" =>
                    [["joomla.xml",
                      "23faf4d03ac8d539e5bdc70056dba8a1"]],
                    "2.5.2" =>
                    [["joomla.xml",
                      "c89bbb4d017e29a236ac4626ed15791b"]],
                    "2.5.3" =>
                    [["joomla.xml",
                      "50be59bf77361df3ee37dc1cb59b6f09"]],
                    "2.5.4" =>
                    [["joomla.xml",
                      "cf7bab3c4aaa6976ce46b24fa9315d3b"]],
                    "2.5.5" =>
                    [["joomla.xml",
                      "9a6697bf0a6b3fd8c367d52a8163e289"]],
                    "2.5.6" =>
                    [["joomla.xml",
                      "fd03f70094e980a288df57b74ba8bdaa"]],
                    "2.5.7" =>
                    [["joomla.xml",
                      "ddfc0ffae42633ae0792879e72848eef"]],
                    "2.5.8" =>
                    [["joomla.xml",
                      "2f60cbc0aacc748ead8942eff735e632"]],
                    "2.5.9" =>
                    [["joomla.xml",
                      "02f88367ece6d41aa277de57c48828b3"]],                     
                    "2.5.10" =>
                    [["joomla.xml",
                      "0327fe30ad173c02eed4d38b9db65326"]],
                    "2.5.11" =>
                    [["joomla.xml",
                      "9dba426830a3728e3fa6c7a53b52502a"]],

                    "3.0.0" =>
                    [["joomla.xml",
                      "83829827b08ba0d13fd395aa2c740109"]],
                    "3.0.1" =>
                    [["joomla.xml",
                      "b8a6ca102b9ce957f7f5a313cace883e"]],
                    "3.0.2" =>
                    [["joomla.xml",
                      "a9b6c08ea9a2586f94a99f00a1d2854c"]],
                    "3.0.3" =>
                    [["joomla.xml",
                      "94620da88c804fd899de117b8e93629e"]],
                    "3.0.4" =>
                    [["joomla.xml",
                      "9e3c107a884b973ffb6a1d6aebc2d7e6"]],

                    "3.1.0" =>
                    [["joomla.xml",
                      "989c6a5368dcf8eb84103209c3664032"]],
                    "3.1.1" =>
                    [["joomla.xml",
                      "9cf5894facfb6fffbc599e19b939d717"]]]

        v = Version.new("Joomla", versions, @base_uri)

        version = v.matches_format
  
	# Return version matches from md5 hashes, if present
	unless version.empty?
        version.each { |ver|
            m << {:name => "MD5 sums", :version => ver}
        }
	end	
    
    # Return aggressive matches
    m
  end
  
end
