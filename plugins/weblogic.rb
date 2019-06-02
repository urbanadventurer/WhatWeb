# encoding: UTF-8

Plugin.define "WebLogic" do
    author "teccm"
    version "0.1.1"
    description "WebLogic console"
    website "https://www.oracle.com/middleware/technologies/weblogic.html"
# Matches #
    matches [
                {:text=>'WebLogic Server'},
                {:regexp=>/WebLogic Server 版本:/ }, # footer
                {:version=>/WebLogic Server 版本:([\d\.]+)</}
            ]
end
