Plugin.define "ThinkPHP" do
    author "teccm"
    version "0.1.1"
    description "ThinkPHP framework"
    website "http://www.thinkphp.cn/"

# Matches #
    matches [
                { :text=>"ThinkPHP V5" },# body
                { :regexp=>/<meta name="description" content=\"ThinkPHP/ },
                { :url=>"/e.topthink.com/Public/static/client.js" },
            ]
end
