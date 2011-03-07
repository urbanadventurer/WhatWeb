Plugin.define "DMOZ" do
author "Andrew Horton"
version "0.1"
description "Categories from dmoz.org. Private Plugin."
examples %w| www.example.com |


def startup
        @ok=false
	begin
	@ok=true
	@db = Mongo::Connection.new("0.0.0.0").db("dmoz")
	@coll=@db.collection("websites")		
	#@coll.create_index([['w', Mongo::ASCENDING]])
	rescue
	@ok=false
	end
end


def passive
	m=[]
        if @ok==true
	website=@base_uri.to_s
	topics= @coll.find({"w"=>/^#{website}[\/]?$/}).map {|row| row["t"] }.compact
	unless topics.empty?
		m << {:string=>topics.join(",")}
	end
	end
	m
end

def shutdown
end


end

