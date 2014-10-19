##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # Pedro Worcel (Security-Assessment.com) <pedro@worcel.com>
# Added agressive scanning.
# ##
# Version 0.3 # 2011-03-06 # Brendan Coles <bcoles@gmail.com>
# Updated version detection
##
# Version 0.2
# removed :certainty=>100 and :name
##
Plugin.define "SilverStripe" do
    author "Andrew Horton"
    version "0.3"
    description "SilverStripe is an opensource CMS written in PHP. It can run on Apache, IIS or lighthttpd."
    website "http://www.silverstripe.com"

    # Matches #
    matches [

        # Meta Generator
        {:regexp=>/<meta name="generator"[^>]*content="SilverStripe/ },

        # layout, typography, form css files
        {:name=>"layout, typography, form css files",
            :certainty=>75,
            :regexp=>/<link[^>]*stylesheet[^>]*layout.css[^>]*>[^<]*<link[^>]*stylesheet[^>]*typography.css[^>]*>[^<]*<link[^>]*stylesheet[^>]*form.css[^>]*>/},

            # Image HTML
            {:certainty=>75, :regexp=>/<img src="\/assets\/[^\/]+\/_resampled\/[^"]+.jpg"/ },

            # Version Detection # Meta Generator
            { :version=>/<meta name="generator"[^>]*content="SilverStripe ([0-9\.]+)/ },

    ] 

    # Passive #
    def passive
        m=[]

        # Set-Cookie: PastVisitor
        m << {:name=>"PastVisitor Cookie" } if @headers["set-cookie"] =~ /PastVisitor=[0-9]+.*/	

            # Return passive matches
            m
    end

    def aggressive
        m=[]
        versions = Hash[
            "2.4.10" => [
              ["cms/css/layout.css", "5db089786a6d5487e16297ce36ab2421"],
            ],
            "2.4.11" => [
              ["cms/css/layout.css", "5db089786a6d5487e16297ce36ab2421"],
            ],
            "2.4.12" => [
              ["cms/css/layout.css", "5db089786a6d5487e16297ce36ab2421"],
            ],
            "2.4.13" => [
              ["cms/css/layout.css", "5db089786a6d5487e16297ce36ab2421"],
            ],
            "2.4.9" => [
              ["cms/css/layout.css", "5db089786a6d5487e16297ce36ab2421"],
            ],
            "3.0.0" => [
              ["cms/javascript/CMSMain.Tree.js", "090622870dcdad0514940bc3249094af"],
              ["framework/javascript/HtmlEditorField.js", "255ea83eb97ed9634eae66326fb5ec20"],
              ["framework/css/AssetUploadField.css", "78fa54480405595296ea61da2b33c42b"],
              ["framework/css/UploadField.css", "2de8e72eb87b371b61b5204c61a2c3d0"],
            ],
            "3.0.1" => [
              ["cms/javascript/CMSMain.Tree.js", "090622870dcdad0514940bc3249094af"],
              ["framework/javascript/HtmlEditorField.js", "765ad037bca7555ca3b9b71f7bdd4fa6"],
              ["framework/css/AssetUploadField.css", "78fa54480405595296ea61da2b33c42b"],
              ["framework/css/UploadField.css", "2de8e72eb87b371b61b5204c61a2c3d0"],
            ],
            "3.0.10" => [
              ["cms/javascript/CMSMain.Tree.js", "07fd09b668960bfb50b11168a381e5d7"],
              ["framework/javascript/HtmlEditorField.js", "570fafc969764a6a4d4a262ca68ab3c3"],
              ["framework/css/AssetUploadField.css", "96593622bd92eb2d3349dbb315c2aee4"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.11" => [
              ["cms/javascript/CMSMain.Tree.js", "07fd09b668960bfb50b11168a381e5d7"],
              ["framework/javascript/HtmlEditorField.js", "570fafc969764a6a4d4a262ca68ab3c3"],
              ["framework/css/AssetUploadField.css", "96593622bd92eb2d3349dbb315c2aee4"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.3" => [
              ["cms/javascript/CMSMain.Tree.js", "ac8d98869ceb76f88999eb149603f1a4"],
              ["framework/javascript/HtmlEditorField.js", "8e0e049b8f8b33e7646de86d5a9661fc"],
              ["framework/css/AssetUploadField.css", "3e02751873aaf1b82813a157511a798e"],
              ["framework/css/UploadField.css", "a5fd3252bbd815a139b7f68e5d63b450"],
            ],
            "3.0.4" => [
              ["cms/javascript/CMSMain.Tree.js", "ac8d98869ceb76f88999eb149603f1a4"],
              ["framework/javascript/HtmlEditorField.js", "000b8ea9d7d97dfea550da9d98117871"],
              ["framework/css/AssetUploadField.css", "3e02751873aaf1b82813a157511a798e"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.5" => [
              ["cms/javascript/CMSMain.Tree.js", "ac8d98869ceb76f88999eb149603f1a4"],
              ["framework/javascript/HtmlEditorField.js", "000b8ea9d7d97dfea550da9d98117871"],
              ["framework/css/AssetUploadField.css", "3e02751873aaf1b82813a157511a798e"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.6" => [
              ["cms/javascript/CMSMain.Tree.js", "07fd09b668960bfb50b11168a381e5d7"],
              ["framework/javascript/HtmlEditorField.js", "570fafc969764a6a4d4a262ca68ab3c3"],
              ["framework/css/AssetUploadField.css", "96593622bd92eb2d3349dbb315c2aee4"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.7" => [
              ["cms/javascript/CMSMain.Tree.js", "07fd09b668960bfb50b11168a381e5d7"],
              ["framework/javascript/HtmlEditorField.js", "570fafc969764a6a4d4a262ca68ab3c3"],
              ["framework/css/AssetUploadField.css", "96593622bd92eb2d3349dbb315c2aee4"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.8" => [
              ["cms/javascript/CMSMain.Tree.js", "07fd09b668960bfb50b11168a381e5d7"],
              ["framework/javascript/HtmlEditorField.js", "570fafc969764a6a4d4a262ca68ab3c3"],
              ["framework/css/AssetUploadField.css", "96593622bd92eb2d3349dbb315c2aee4"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.0.9" => [
              ["cms/javascript/CMSMain.Tree.js", "07fd09b668960bfb50b11168a381e5d7"],
              ["framework/javascript/HtmlEditorField.js", "570fafc969764a6a4d4a262ca68ab3c3"],
              ["framework/css/AssetUploadField.css", "96593622bd92eb2d3349dbb315c2aee4"],
              ["framework/css/UploadField.css", "2f87b4d81b99a72d3adfcfd24a6c630f"],
            ],
            "3.1.0" => [
              ["cms/javascript/CMSMain.Tree.js", "b7d5d25c05391972db3a18d0876c1fcf"],
              ["framework/javascript/HtmlEditorField.js", "89b64a68adbd2d6ed522c2f8add9238a"],
              ["framework/css/AssetUploadField.css", "e1e5a8092f3cf0c4ef1456a969be947c"],
              ["framework/css/UploadField.css", "a0d66636a849b56b56f61402ea9960a8"],
            ],
            "3.1.1" => [
              ["cms/javascript/CMSMain.Tree.js", "b7d5d25c05391972db3a18d0876c1fcf"],
              ["framework/javascript/HtmlEditorField.js", "89b64a68adbd2d6ed522c2f8add9238a"],
              ["framework/css/AssetUploadField.css", "e1e5a8092f3cf0c4ef1456a969be947c"],
              ["framework/css/UploadField.css", "a0d66636a849b56b56f61402ea9960a8"],
            ],
            "3.1.2" => [
              ["cms/javascript/CMSMain.Tree.js", "33e888d268d7b416e8aa67ea6f0a23cf"],
              ["framework/javascript/HtmlEditorField.js", "b1d7740a9df73fffbe00728dc5ca8a05"],
              ["framework/css/AssetUploadField.css", "cc8efd0624a4303cb74b8f62630f7f29"],
              ["framework/css/UploadField.css", "a0d66636a849b56b56f61402ea9960a8"],
            ],
            "3.1.3" => [
              ["cms/javascript/CMSMain.Tree.js", "33e888d268d7b416e8aa67ea6f0a23cf"],
              ["framework/javascript/HtmlEditorField.js", "96171723086e6fe55af56e647f85808f"],
              ["framework/css/AssetUploadField.css", "763746a3e65db5bbe95da9ede2e6565e"],
              ["framework/css/UploadField.css", "e727401b89b6fbf788ea586d2e2d0cf3"],
            ],
            "3.1.4" => [
              ["cms/javascript/CMSMain.Tree.js", "33e888d268d7b416e8aa67ea6f0a23cf"],
              ["framework/javascript/HtmlEditorField.js", "96171723086e6fe55af56e647f85808f"],
              ["framework/css/AssetUploadField.css", "763746a3e65db5bbe95da9ede2e6565e"],
              ["framework/css/UploadField.css", "2df14cdcde6363226f7efdeb938fa543"],
            ],
            "3.1.5" => [
              ["cms/javascript/CMSMain.Tree.js", "33e888d268d7b416e8aa67ea6f0a23cf"],
              ["framework/javascript/HtmlEditorField.js", "96171723086e6fe55af56e647f85808f"],
              ["framework/css/AssetUploadField.css", "763746a3e65db5bbe95da9ede2e6565e"],
              ["framework/css/UploadField.css", "2df14cdcde6363226f7efdeb938fa543"],
            ],
        ]

        v = Version.new("SilverStripe", versions, @base_uri)

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


