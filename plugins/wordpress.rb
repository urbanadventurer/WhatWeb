##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.5 # 2012-03-05
# Added regex version detection for /readme.html
##
# Version 0.4 # 2011-04-06 #
# Added aggressive md5 matches
##
# Version 0.3
# Now using :version=>// instead of a passive function, added description, examples and included relative /wp-content/ link detection
##
Plugin.define "WordPress" do
  author "Andrew Horton"
  version "0.5"
  description "WordPress is an opensource blogging system commonly used as a CMS."
  website "http://www.wordpress.org/"
  
  # Dorks #
  dorks [
           '"is proudly powered by WordPress"'
        ]
  
  # Matches #
matches [
         
         {:text=>'<meta name="generator" content="WordPress.com" />'},
         {:text=>'<a href="http://www.wordpress.com">Powered by WordPress</a>', :name=>'powered by link'},
         {:text=>"<link rel='https://api.w.org/'", :name=>'REST API link'},

         {:regexp=>/"[^"]+\/wp-content\/[^"]+"/, :name=>"wp-content", :certainty=>75 },
         
         {:version=>/<meta name="generator" content="WordPress ([0-9\.]+)"/ },
         
         # url exists, i.e. returns HTTP status 200
         {:url=>"/wp-cron.php"},
         
         #{:url=>"/admin/", :full=>true }, # full means that whatweb will run all plugins against this url - this isn't yet implemented as of 0.4.7
         
         # /wp-login.php  exists & contains a string
         {:url=>"/wp-login.php", :text=>'<a title="Powered by WordPress" href="http://wordpress.org/">'},
         {:url=>"/wp-login.php", :text=>'<a href="http://wordpress.org/" title="Powered by WordPress">', :name=>'wp3 login page'},
         {:url=>"/wp-login.php", :text=>'action=lostpassword'},
         
         {:url=>"/wp-login.php", :tagpattern=>"!doctype,html,head,title,/title,meta,link,link,script,/script,meta,/head,body,div,h1,a,/a,/h1,form,p,label,br,input,/label,/p,p,label,br,input,/label,/p,p,label,input,/label,/p,p,input,input,input,/p,/form,p,a,/a,/p,p,a,/a,/p,/div,script,/script,/body,/html"}, #note that WP plugins can add script tags. tags are delimited by commas so we can count how close it is
         {:url=>"favicon.ico", :md5=>'f420dc2c7d90d7873a90d82cd7fde315'}, # not common, seen on http://s.wordpress.org/favicon.ico
         {:url=>"favicon.ico", :md5=>'fa54dbf2f61bd2e0188e47f5f578f736', :name=>'WordPress.com favicon'},  # on wordpress.com blogs  http://s2.wp.com/i/favicon.ico 
         
         {:url=>"/readme.html", :version=>/<h1.*WordPress.*Version ([0-9a-z\.]+).*<\/h1>/m}
         
        ]
  
  # Passive #
  def passive
    m=[]
    
    # detect /wp-content/ on this site but don't be confused by links to other sites.
    #<link rel="stylesheet" href="http://bestwebgallery.com/wp-content/themes/master/style.css" type="text/css" />
    
    if @body =~ /(href|src)="[^"]*\/wp-content\/[^"]*/
      # is it a relative link or on the same site?
      links= @body.scan(/(href|src)="([^"]*\/wp-content\/[^"]*)/).map {|x| x[1].strip }.flatten
      links.each do |thislink|
        # join this link wtih target, check if host part is ==, if so, it's relative
        joined_uri=URI.join(@base_uri.to_s,thislink)
        
        if joined_uri.host == @base_uri.host
          #puts "yes, #{joined_uri.to_s} is relative to #{@base_uri.to_s}"
          m << {:name=>"Relative /wp-content/ link" }
          break
        end
      end
    end
    
    # Return passive matches
    m
  end
  
  # Aggressive #
  def aggressive
    m=[]
    
    # the paths are relative to the url path if they don't start with /
    # this path, with this md5 = this version

    versions = Hash[
                    "0.71-gold" =>
                    [["readme.html",
                      "0c1e4a01d4ccf6dbedda30bf3c5eeb9e"],
                     ["b2-include/xmlrpc.inc",
                      "14524c5d7f9f72394e04512d9941bc50"]],
                    "0.72-rc1" =>
                    [["readme.html",
                      "dacf325336ae55fffbcd54bd08de55b4"],
                     ["wp-layout.css",
                      "dc04833fd754c0b404ec157e0bb8e7ae"]],
                    "0.72-beta1" =>
                    [["readme.html",
                      "dacf325336ae55fffbcd54bd08de55b4"],
                     ["wp-layout.css",
                      "7edb4d6b89b4625f6e6c6b9e5cd589b6"]],
                    "1.0-rc1" =>
                    [["readme.html",
                      "613b5eca59267b5b62b6e81dd9536b1b"],
                     ["wp-sitetemplates/main/templates/top.html",
                      "120ca99e1b816915e0f27152b7d24a75"]],
                    "1.0-platinium" =>
                    [["readme.html",
                      "6e08f4bfb7f79de78a3278f0f4ad981f"]],
                    "1.0.1-rc1" =>
                    [["readme.html",
                      "11f6a057f13e9413edc98e4614230622"]],
                    "1.0.1-miles" =>
                    [["readme.html",
                      "7ccd56b1c5b7123ed9afb222e6e93924"]],
                    "1.0.2" =>
                    [["readme.html",
                      "c91375254e9f56e45939ffcc28424c72"]],
                    "1.0.2-blakey" =>
                    [["readme.html",
                      "c91375254e9f56e45939ffcc28424c72"]],
                    "1.2-rc1" =>
                    [["readme.html",
                      "790736d62d442117f9d28b64161919a2"]],
                    "1.2-rc2" =>
                    [["readme.html",
                      "790736d62d442117f9d28b64161919a2"]],
                    "1.2-beta" =>
                    [["readme.html",
                      "790736d62d442117f9d28b64161919a2"],
                     ["wp-layout.css",
                      "c3f4bd5f3146770c0cba45b10c385047"]],
                    "1.2-delta" =>
                    [["readme.html",
                      "790736d62d442117f9d28b64161919a2"],
                     ["wp-layout.css",
                      "1bcc9253506c067eb130c9fc4f211a2f"]],
                    "1.2-mingus" =>
                    [["readme.html",
                      "6c3c457ed408be44244edc121cada9a2"],],
                    "1.2.1" =>
                    [["readme.html",
                      "75eaf1c4b267e11fffd42c34e8832567"],
                     ["wp-layout.css",
                      "7140e06c00ed03d2bb3dad7672557510"]],
                    "1.2.2" =>
                    [["readme.html",
                      "6c3c457ed408be44244edc121cada9a2"],
                     ["wp-includes/js/scriptaculous/scriptaculous.js",
                      "d72a1c859799b4e1355ff65e4a1ad148"]],
                    "1.5-strayhorn" =>
                    [["readme.html",
                      "aaa2d12586d9632c76b7b7f03d58a9f6"]],
                    "1.5.1" =>
                    [["readme.html",
                      "c60692ee8e176db0ac0be5ca69ba6c24"]],
                    "1.5.1.1" =>
                    [["readme.html",
                      "c60692ee8e176db0ac0be5ca69ba6c24"]],
                    "1.5.1.2" =>
                    [["readme.html",
                      "c60692ee8e176db0ac0be5ca69ba6c24"]],
                    "1.5.1.3" =>
                    [["readme.html",
                      "aaa2d12586d9632c76b7b7f03d58a9f6"]],
                    "1.5.2" =>
                    [["readme.html",
                      "aaa2d12586d9632c76b7b7f03d58a9f6"]],
                    "2.0" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"],
                     ["wp-content/themes/default/style.css",
                      "f786f66d3a40846aa22dcdfeb44fa562"]],
                    "2.0.1" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.1-rc1" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.4" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.5" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.5-rc1" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.5-beta1" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.6" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.6-rc1" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.7" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.7-rc1" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.7-rc2" =>
                    [["readme.html",
                      "010ac2a095f4d30b2a650b94cf3f8842"]],
                    "2.0.8" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.8-rc1" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.9" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.9-rc1" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.9-beta" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.10" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.10-rc1" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.10-rc2" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.10-rc3" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.11" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.11-rc1" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.11-rc2" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.0.11-rc3" =>
                    [["readme.html",
                      "ec9a2ffad38a3f0185aa6d9c0b8d6673"]],
                    "2.1" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1-rc1" =>
                    [["readme.html",
                      "1808e8f88b490dffdfe0e3ea0a951e86"]],
                    "2.1-rc2" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1-beta1" =>
                    [["readme.html",
                      "33228916bae952810ca10a09b23bc366"]],
                    "2.1-beta2" =>
                    [["readme.html",
                      "0bb72a5175266c98406b8b42a31114de"]],
                    "2.1-beta3" =>
                    [["readme.html",
                      "1808e8f88b490dffdfe0e3ea0a951e86"],
                     ["wp-includes/js/tinymce/plugins/inlinepopups/editor_plugin.js",
                      "527706a40c4a6939c1a47db7a6c4dbaf"]],
                    "2.1-beta4" =>
                    [["readme.html",
                      "1808e8f88b490dffdfe0e3ea0a951e86"]],
                    "2.1.1" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.1-rc1" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.1-beta" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.2" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.3" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.3-rc1" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.3-rc2" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.1.3-rc3" =>
                    [["readme.html",
                      "a5bc745849e1971abf8efb9a135ce764"]],
                    "2.2" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2-rc1" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2-rc2" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2.1" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2.1-rc1" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2.1-rc2" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2.2" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.2.3" =>
                    [["readme.html",
                      "939a797929aec1b8e0039014e9a29433"]],
                    "2.3" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3-rc1" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3-beta1" =>
                    [["readme.html",
                      "0384d4bdace37e066df6bb7a85b009aa"]],
                    "2.3-beta2" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3-beta3" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.1" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.1-rc1" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.1-beta1" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.2" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.2-rc1" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.2-beta1" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.2-beta2" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.2-beta3" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.3.3" =>
                    [["readme.html",
                      "95803b846df1873416ee96c1577b3adf"]],
                    "2.5" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"]],
                    "2.5-rc1" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"],
                     ["wp-includes/js/autosave.js",
                      "c2fa52e7e956c340da6e2d2d86694cee"]],
                    "2.5-rc2" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"],
                     ["wp-includes/js/autosave.js",
                      "d275157ac090ce476b4914505f8de24f"]],
                    "2.5-rc3" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"]],
                    "2.5.1" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"],
                     ["wp-includes/js/tinymce/tiny_mce.js",
                      "a3d05665b236944c590493e20860bcdb"]],
                    "2.6" =>
                    [["readme.html",
                      "5bca147a86a1d277328c298ab06b772b"]],
                    "2.6-rc1" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"]],
                    "2.6-beta1" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"],
                     ["wp-includes/js/tinymce/tiny_mce.js",
                      "35f98a53dd50907c60b872213da50deb"]],
                    "2.6-beta2" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"],
                     ["wp-includes/js/tinymce/plugins/wpeditimage/editimage.html",
                      "48a67e901144ce41af63c8e7d680ac74"]],
                    "2.6-beta3" =>
                    [["readme.html",
                      "c3024b888aeb1539f4c29df7b166d483"],
                     ["wp-includes/js/tinymce/plugins/wpeditimage/editimage.html",
                      "e1e9459af693c6076a6d99997d851ab4"]],
                    "2.6.1" =>
                    [["readme.html",
                      "0377751ad219ccbb809d527952ff7325"]],
                    "2.6.1-beta1" =>
                    [["readme.html",
                      "5bca147a86a1d277328c298ab06b772b"],
                     ["wp-includes/js/tinymce/plugins/wpeditimage/editimage.html",
                      "cb6e865aa733445c260ac01899542756"]],
                    "2.6.1-beta2" =>
                    [["readme.html",
                      "5bca147a86a1d277328c298ab06b772b"]],
                    "2.6.2" =>
                    [["readme.html",
                      "0377751ad219ccbb809d527952ff7325"]],
                    "2.6.3" =>
                    [["readme.html",
                      "0377751ad219ccbb809d527952ff7325"]],
                    "2.6.5" =>
                    [["readme.html",
                      "0377751ad219ccbb809d527952ff7325"]],
                    "2.7" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.7-rc1" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"],
                     ["wp-includes/js/swfupload/handlers.js",
                      "a16a9cb39d37486aeacd3b2e1701f6aa"]],
                    "2.7-rc2" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.7-beta1" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"],
                     ["wp-includes/js/autosave.js",
                      "9ceecef42a279029e0f97b4def8e542b"]],
                    "2.7-beta2" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"],
                     ["wp-includes/js/autosave.js",
                      "c1ea7016092c130a51a44ffe232bc7c9"]],
                    "2.7-beta3" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"],
                     ["wp-includes/js/tinymce/tiny_mce.js",
                      "f73b7c82ff78af24cd7563862084000a"]],
                    "2.7.1" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.7.1-rc1" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.8" =>
                    [["readme.html",
                      "4a64408bdaaa6c8af7cab9346f0ce380"]],
                    "2.8-rc1" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.8-beta1" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.8-beta2" =>
                    [["readme.html",
                      "94c4cdfa20778d1bf9784941f9fca133"]],
                    "2.8.1" =>
                    [["readme.html",
                      "7ed95e0b7ae663cbd0a8e77d787a4637"]],
                    "2.8.1-rc1" =>
                    [["readme.html",
                      "4a64408bdaaa6c8af7cab9346f0ce380"]],
                    "2.8.1-beta1" =>
                    [["readme.html",
                      "4a64408bdaaa6c8af7cab9346f0ce380"],
                     ["wp-includes/js/autosave.js",
                      "40f836bb6cf8fa6007aa2bd335754590"]],
                    "2.8.1-beta2" =>
                    [["readme.html",
                      "4a64408bdaaa6c8af7cab9346f0ce380"],
                     ["wp-includes/js/autosave.js",
                      "8e58ac561fd6f038843395e7e18fbb0f"]],
                    "2.8.2" =>
                    [["readme.html",
                      "ef8665ddd2d87badccb3532705b95992"],
                     ["wp-content/plugins/akismet/readme.txt",
                      "48c52025b5f28731e9a0c864c189c2e7"]],
                    "2.8.3" =>
                    [["readme.html",
                      "de32a1268d126ea71127ad5f9fa8f60d"]],
                    "2.8.4" =>
                    [["readme.html",
                      "7d93c7feb3e2e2c2112474f92e3ee6f8"]],
                    "2.8.5" =>
                    [["readme.html",
                      "f32252ef12c927f6285e4fb29efce04f"]],
                    "2.8.5-beta1" =>
                    [["readme.html",
                      "f32252ef12c927f6285e4fb29efce04f"]],
                    "2.8.6" =>
                    [["readme.html",
                      "027283d03b08abae67279fd17a37760b"]],
                    "2.8.6-beta1" =>
                    [["readme.html",
                      "027283d03b08abae67279fd17a37760b"]],
                    "2.9" =>
                    [["readme.html",
                      "1eaf3b4f4c2d039d26a473c0e0b5622e"]],
                    "2.9-rc1" =>
                    [["readme.html",
                      "f182f41b25a96a12c393e35d9d063ed4"]],
                    "2.9-beta1" =>
                    [["readme.html",
                      "f182f41b25a96a12c393e35d9d063ed4"],
                     ["wp-includes/js/swfupload/handlers.js",
                      "67c19dd1aa288610db84ef258e0fde22"]],
                    "2.9-beta2" =>
                    [["readme.html",
                      "f182f41b25a96a12c393e35d9d063ed4"],
                     ["wp-includes/js/swfupload/handlers.js",
                      "829d0ee86744a34049329f5c461d12d0"]],
                    "2.9.1" =>
                    [["readme.html",
                      "80c4ecc8630395baeb7363a7cf4dad33"]],
                    "2.9.1-rc1" =>
                    [["readme.html",
                      "80c4ecc8630395baeb7363a7cf4dad33"]],
                    "2.9.1-beta1" =>
                    [["readme.html",
                      "1eaf3b4f4c2d039d26a473c0e0b5622e"]],
                    "2.9.2" =>
                    [["readme.html",
                      "6cfb514bbb51d883bb6fece65d5fd450"],
                     ["wp-content/themes/home/rtl.css",
                      "64231a50358031e1d92bb02ffcc5579d"]],
                    "3.0" =>
                    [["readme.html",
                      "9ea06ab0184049bf4ea2410bf51ce402"],
                     ["wp-content/themes/twentyten/languages/twentyten.pot",
                      "2ea37779cc9cbfc274f1a0273a6ea1b5"]],
                    "3.0-rc1" =>
                    [["readme.html",
                      "9ea06ab0184049bf4ea2410bf51ce402"],
                     ["wp-content/themes/twentyten/style.css",
                      "5e86e1dd9c095c1bf8ea8e5ec53bee1e"]],
                    "3.0-rc2" =>
                    [["readme.html",
                      "9ea06ab0184049bf4ea2410bf51ce402"],
                     ["wp-content/themes/twentyten/style.css",
                      "23fd2a602c38ec4c611559fb1552afcd"]],
                    "3.0-rc3" =>
                    [["readme.html",
                      "9ea06ab0184049bf4ea2410bf51ce402"],
                     ["wp-content/themes/twentyten/languages/twentyten.pot",
                      "497963f44fb84e2c7d425c1fd4eed76e"]],
                    "3.0-beta1" =>
                    [["readme.html",
                      "b051ca0b7f06618784dd286da1b3ce95"],
                     ["wp-includes/js/autosave.js",
                      "a27e28943c0ce3e0438c03c83092c919"]],
                    "3.0-beta2" =>
                    [["readme.html",
                      "9ea06ab0184049bf4ea2410bf51ce402"],
                     ["wp-includes/js/autosave.js",
                      "46149fb60863c31931ba3b4c2698bff4"]],
                    "3.0.1" =>
                    [["readme.html",
                      "a73cac84b8b9a99377917a6974c9eea2"]],
                    "3.0.2" =>
                    [["readme.html",
                      "0538342b887f11ed4a306d3e7c7d6ea7"]],
                    "3.0.3" =>
                    [["readme.html",
                      "0eb4f7981c3de98df925b3020c147a61"]],
                    "3.0.4" =>
                    [["readme.html",
                      "c7a01d814ffbbb790ee5f4f8f3631903"]],
                    "3.0.5" =>
                    [["readme.html",
                      "ed20f283f2c1b775219bdb12e5c6ba93"]],
                    "3.0.6" =>
                    [["readme.html",
                      "45119882b8d576a3462f76708b6bc1c5"]],
                    "3.1" =>
                    [["readme.html",
                      "f01635ffca23e49e01f47e98553ea75d"]],
                    "3.1-rc1" =>
                    [["readme.html",
                      "d48f95db161328051787e2f427148f4a"],
                     ["wp-content/themes/twentyten/languages/twentyten.pot",
                      "0aac287d00db838d3bc01a1d6d621d2f"]],
                    "3.1-rc2" =>
                    [["readme.html",
                      "d48f95db161328051787e2f427148f4a"],
                     ["wp-content/themes/twentyten/style.css",
                      "150c80e23ce93ebced5035e00e4d864b"]],
                    "3.1-rc3" =>
                    [["readme.html",
                      "f01635ffca23e49e01f47e98553ea75d"],
                     ["wp-includes/css/admin-bar-rtl.css",
                      "c032baf7fa4ed30d82b46946f75cbc69"]],
                    "3.1-rc4" =>
                    [["readme.html",
                      "f01635ffca23e49e01f47e98553ea75d"]],
                    "3.1-beta1" =>
                    [["readme.html",
                      "7a8b02d6ce7229e33bd64da8bef83ad7"],
                     ["wp-includes/css/admin-bar.css",
                      "d858495789b9a37ef8651f54a9f2e12b"]],
                    "3.1-beta2" =>
                    [["readme.html",
                      "d48f95db161328051787e2f427148f4a"],
                     ["wp-includes/css/admin-bar.css",
                      "912a71bf5137e3a06911d1ebd855c2b7"]],
                    "3.1.1" =>
                    [["readme.html",
                      "5be6140fc3f44126b476dfff5bc0c658"]],
                    "3.1.1-rc1" =>
                    [["readme.html",
                      "5be6140fc3f44126b476dfff5bc0c658"]],
                    "3.1.2" =>
                    [["readme.html",
                      "20f882b08b2804bc7431c0866a8999d1"]],
                    "3.1.3" =>
                    [["readme.html",
                      "ccc403368e01b3c3b0caf28079a710a5"]],
                    "3.1.4" =>
                    [["readme.html",
                      "fbebf5899944a9d7aedd00250bb71745"],
                     ["wp-content/themes/twentyten/languages/twentyten.pot",
                      "0702faf14edacb91bb82681870cb6da0"]],
                    "3.2" =>
                    [["readme.html",
                      "573e79628d2ee07670e889569059669e"]],
                    "3.2-rc1" =>
                    [["readme.html",
                      "573e79628d2ee07670e889569059669e"],
                     ["wp-content/themes/twentyeleven/style.css",
                      "5a13b9234881621dca42f9430bfdd885"]],
                    "3.2-rc2" =>
                    [["readme.html",
                      "573e79628d2ee07670e889569059669e"],
                     ["wp-content/themes/twentyeleven/style.css",
                      "31156206fec3debcc2f9b844ef83d9e1"]],
                    "3.2-rc3" =>
                    [["readme.html",
                      "573e79628d2ee07670e889569059669e"],
                     ["wp-content/themes/twentyeleven/style.css",
                      "81b2771858d8ab1ed3ae13d8d5866561"]],
                    "3.2-beta1" =>
                    [["readme.html",
                      "573e79628d2ee07670e889569059669e"],
                     ["wp-includes/js/autosave.js",
                      "3bf40ac97632994f5ee6d8d4fc72f0d3"]],
                    "3.2-beta2" =>
                    [["readme.html",
                      "573e79628d2ee07670e889569059669e"],
                     ["wp-includes/js/tinymce/plugins/wordpress/editor_plugin.js",
                      "708373211fb001cba51de1138ff9e748"]],
                    "3.2.1" =>
                    [["readme.html",
                      "98d3f05ff1e321dbd58ad154cc95e569"]],
                    "3.3" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"]],
                    "3.3-rc1" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"],
                     ["wp-includes/css/admin-bar.css",
                      "304a1620b044cc58cef73349359943b3"]],
                    "3.3-rc2" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"],
                     ["wp-includes/css/admin-bar.css",
                      "9bb37fe637ee3a53d9274fd2d0301260"]],
                    "3.3-rc3" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"]],
                    "3.3-beta1" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"],
                     ["wp-includes/css/admin-bar.css",
                      "7d21a462f3b5d5b9ad1f878c45f78e92"]],
                    "3.3-beta2" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"],
                     ["wp-includes/css/admin-bar.css",
                      "e8af3c520f06153ad674eebd7453971e"]],
                    "3.3-beta3" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"],
                     ["wp-includes/css/admin-bar.css",
                      "a30deaec087f1eab3183a2b9d50cd19b"]],
                    "3.3-beta4" =>
                    [["readme.html",
                      "e0f97110b60c3a3c71dcd1d4d923495a"],
                     ["wp-includes/css/admin-bar.css",
                      "4e6bda0b7acff641f480c4fd5d5b6910"]],
                    "3.3.1" =>
                    [["readme.html",
                      "c1ed266e26a829b772362d5135966bc3"]],
                    "3.3.2" =>
                    [["readme.html",
                      "628419c327ca5ed8685ae3af6f753eb8"]],
                    "3.3.2-rc1" =>
                    [["readme.html",
                      "628419c327ca5ed8685ae3af6f753eb8"]],
                    "3.3.3" =>
                    [["readme.html",
                      "36b2b72a0f22138a921a38db890d18c1"]],
                    "3.4" =>
                    [["readme.html",
                      "34b3071c2c48f0b1a611c2ee9f1b3516"]],
                    "3.4-rc1" =>
                    [["readme.html",
                      "34b3071c2c48f0b1a611c2ee9f1b3516"],
                     ["wp-includes/js/customize-preview.js",
                      "453a5ccf234fb8d8ce360aca3672ed95"]],
                    "3.4-rc2" =>
                    [["readme.html",
                      "34b3071c2c48f0b1a611c2ee9f1b3516"],
                     ["wp-includes/js/customize-preview.js",
                      "7b1408a3cd59c8287efa8c02bd43356e"]],
                    "3.4-rc3" =>
                    [["readme.html",
                      "34b3071c2c48f0b1a611c2ee9f1b3516"]],
                    "3.4-rc4" =>
                    [["readme.html",
                      "34b3071c2c48f0b1a611c2ee9f1b3516"]],
                    "3.4-beta1" =>
                    [["readme.html",
                      "8df86e1e534c349747292e0b56531f63"],
                     ["wp-includes/js/tinymce/tiny_mce.js",
                      "078bd9e2c8fa7b6c2ab231183f6ee2cb"]],
                    "3.4-beta2" =>
                    [["readme.html",
                      "8df86e1e534c349747292e0b56531f63"]],
                    "3.4-beta3" =>
                    [["readme.html",
                      "8df86e1e534c349747292e0b56531f63"],
                     ["wp-includes/js/customize-preview.js",
                      "e28df79d5eb55f26b46ae88bafadc2b9"]],
                    "3.4-beta4" =>
                    [["readme.html",
                      "8df86e1e534c349747292e0b56531f63"],
                     ["wp-includes/js/customize-preview.js",
                      "a8a259fc5197a78ffe62d6be38dc52f8"]],
                    "3.4.1" =>
                    [["readme.html",
                      "9ecbb128295ac324f63a6adc0b6e78ea"],
                     ["wp-includes/js/customize-preview.js",
                      "617d9fd858e117c7d1d087be168b5643"]],

                      "3.4.2" =>
                    [["readme.html", "c6514a15e04bd9ec96df4d9b78c17bc5"],
                      ["wp-includes/js/customize-preview.js", "617d9fd858e117c7d1d087be168b5643"],
                      ["/wp-admin/css/wp-admin.css", "dc906af62607ada3fe2baac62ac3cceb"] 
                    ],
                      "3.5" =>
                    [["readme.html", "066cfc0f9b29ae6d491aa342ebfb1b71"],
                      ["wp-admin/css/wp-admin.css", "c8c02c7d0318ddeb985e324f126a19e8"]
                    ],
                      "3.5.1" => 
                    [["readme.html", "05d50a04ef19bd4b0a280362469bf22f"],
                      ["wp-admin/css/wp-admin.css", "1906ac1bed40e0c5c7de71f2bc42dc20"]
                    ],
                      "3.5.2" =>
                    [["readme.html", "caf7946275c3e885419b1d36b22cb5f3"],
                      ["wp-admin/css/wp-admin.css", "1906ac1bed40e0c5c7de71f2bc42dc20"]
                    ],
                      "3.6" =>
                    [["readme.html", "477f1e652f31dae76a38e3559c91deb9"],
                      ["wp-admin/css/wp-admin.css", "25dd20710bf1eec392a00fc892b63fde"]
                    ],
                      "3.6.1" =>
                    [["readme.html", "e82f4fe7d3c1166afb4c00856b875f16"],
                      ["wp-admin/css/wp-admin.css", "25dd20710bf1eec392a00fc892b63fde"]
                    ],
                      "3.7" =>
                    [["readme.html", "4717bf89e299ff054760ec8b0768c9e1"],
                      ["wp-admin/css/wp-admin.css", "f0894fa9c9733d0e577fc5beddc726cd"]
                    ],
                      "3.7.1" =>
                    [["readme.html", "4717bf89e299ff054760ec8b0768c9e1"],
                      ["wp-admin/css/wp-admin.css", "f0894fa9c9733d0e577fc5beddc726cd"]
                    ],
                      "3.8" =>
                    [["readme.html", "38ee273095b8f25b9ffd5ce5018fc4f0"],
                      ["wp-admin/css/wp-admin.css", "25554fc81989c307119b7d4818dc3963"]
                    ],
                      "3.8.1" =>
                    [["readme.html", "0d0eb101038124a108f608d419387b92"],
                      ["wp-admin/css/wp-admin.css", "68600417d5dc22244168b4eeb84f0af4"]
		    ],
                      "3.8.2" =>
                    [["readme.html", "e01a2663475f6a7a8363a7c75a73fe23"],
                      ["wp-admin/css/wp-admin.css", "68600417d5dc22244168b4eeb84f0af4"]
		    ],
                      "3.8.3" =>
                    [["readme.html", "c6de8fc70a18be7e5c36198cd0f99a64"],
                      ["wp-admin/css/wp-admin.css", "68600417d5dc22244168b4eeb84f0af4"]
		    ],
                      "3.9" =>
                    [["readme.html", "cdbf9b18e3729b3553437fc4e9b6baad"],
                      ["wp-admin/css/wp-admin.css", "ff37a40c48d23ba4ecc09d9a98da1247"]
		    ],
                      "3.9.1" =>
                    [["readme.html", "84b54c54aa48ae72e633685c17e67457"],
                      ["wp-admin/css/wp-admin.css", "ff37a40c48d23ba4ecc09d9a98da1247"]
		    ],
    ]
    
    v = Version.new("WordPress", versions, @base_uri)
    
    version = v.matches_format
    
    # Set version if present
    unless version.empty?
        version.each { |ver|
            m << {:name => "md5 sums of files", :version => ver}
        }
    end
    
    # Return aggressive matches
    m
  end
  
end

