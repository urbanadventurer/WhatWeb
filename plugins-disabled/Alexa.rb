Plugin.define "Alexa" do
author "Andrew Horton"
version "0.1"
description "Ranking from alexa.com"

# To import,
# mongoimport -d alexa -c alexa -f rank,domain -type csv top-1m.csv


# is alexa trying to be for domains or websites? hard to tell.
#
# alexa list examples:
#
# 49772,blogger-templates.blogspot.com
# 49779,bangpai.taobao.com/user/groups
# 150952,77.91.226.162
# 149591,park1.aeonnet.ne.jp/~tamu
# 235344,32.ca.364a.static.theplanet.com/~science
# 154058,188.241.200.193.static.giga-dns.com/~serpee


def startup
       @ok=false

       if defined?(Mongo)
        @ok=true
	begin
        @db = Mongo::Connection.new("0.0.0.0").db("alexa")
        @coll=@db.collection("alexa")
	#@coll.create_index("domain")
	rescue
	@ok=false
	end
       end
end

def passive
        m=[]
	if @ok==true
		# get domain from website, try it.
		# split by . for www.a.b.c.d.com try a.b.c.d.com then b.c.d.com etc

	#foo=a.dup; (1..a.count(".")).each {|x|  puts foo; foo=foo[foo.index('.',x)+1..-1]  }
	#www.a.b.c.d.e.f.com
	#a.b.c.d.e.f.com
	#c.d.e.f.com
	#e.f.com

	# note, example.com is used for local files
	

		website=@base_uri.host
		trythis = website.dup.to_s
		foundrank=nil
		(1..trythis.count(".")).each {|x|
			# search for try this
			results = @coll.find({"domain"=>trythis}).map
			#pp results
			#pp trythis
			unless results.empty?
				foundrank = results.first["rank"]
				break
			end
			# if trythis isn't found, trim one more time
			trythis=trythis[trythis.index('.',x)+1..-1] unless trythis.index('.',x).nil?  # trim trythis down one more.
		}

		unless foundrank.nil?
		        m << {:string=>foundrank}
		end
	end
        m
end

def shutdown
end

end

