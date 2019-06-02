Plugin.define "eWebEditor" do
    author "teccm"
    version "0.1.1"
    description "EWeb Editor is a browser-based, WYSIWYG online HTML editor."
    website "http://www.ewebeditor.net/"
    matches [
                { :text=>"<title>eWebEditor" },# title
                { :text=>"<TITLE>eWebEditor" },# title
                { :regexp=>/<title>eWebEditor/i},
                { :text=>"eWebEditor 5.5" },# body
                { :regexp=>/<meta name="description" content=\"eWebEditor/ },
                { :regexp=>/Copyright\s\©\s2003-2008\s<b>eWebEditor/ },
                {:version=>/>eWebEditor v([\d\.]+)/m}
            ]
end
