Plugin.define "IP" do
author "Andrew Horton"
version "0.1"
description "IP address of the target, if available."

def passive
m=[]

m << {:string=>@ip,:name=>"IP" }
m
end

end

