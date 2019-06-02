Plugin.define "FCKeditor" do
    author "teccm"
    version "0.1.1"
    description "FCKeditor is one of the best visible and accessible web page editors at present. It is written in JavaScript."
    website "https://ckeditor.com/"
    matches [
                {:text => "FCKeditor - JavaScript"}, # body
                {:regexp => /<a href="http:\/\/www.fckeditor.net\/"/},
                {:text => "FCKeditor - The text editor for Internet - http://www.fckeditor.net"},
            ]
end
