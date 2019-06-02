Plugin.define "e107" do
    author "teccm"
    version "0.1.1"
    description "e107 CMS"
    website "https://e107.org/"

# Matches #
    matches [
                { :text=>"e107 Powered Website" },# title
                { :regexp=>/<a href="http:\/\/e107.org"/ },
                { :regexp=>/This site is powered by <a href="http:\/\/e107.org"/ },
            ]
end
