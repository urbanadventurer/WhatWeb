
Plugin.define do
name "GeneXus"
author "Daniel Maldonado"
version "0.1"
description "GeneXus is a tool for agile development."
website "http://caceriadespammers.com.ar"

matches [
	{:text=>"<meta name=\"Generator\" content=\"GeneXus\" />"},
]

def passive
	m=[]
end

def aggressive
	m=[]
end

end
