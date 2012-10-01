class   Version
  def   initialize(name_product = nil, versions = nil, url = nil)
    @name = name_product
    @versions = versions
    @files = Hash["filenames" => [], "files" => [], "md5" => []]
    @url = url
    @got_best_versions = false
    @best_versions = []
    
    if @name == nil
      raise "You must specify the name of the product"
    elsif @versions == nil
      raise "You must specify the available versions of the product"
    elsif @url == nil
      raise "You must specify the available url of the website"
    end
   
    versions.each do |version|
      version[1].each do |file|
        if not @files["filenames"].include? file[0]
          @files["filenames"].push(file[0])
          @files["files"].push(URI.join(@url.to_s, file[0]).to_s)
          status, url, ip, body, headers = open_target(@files["files"].last)
          @files["md5"].push(Digest::MD5.hexdigest(body))
        end
      end
    end
  end
  
  def best_matches
    if @got_best_versions == true
      return @best_versions
    end
    
    @versions.each do |version|
      count = 0
      version[1].each do |file|
        i = @files["filenames"].index(file[0])
        if @files["md5"][i] == file[1]
          count += 1
        end
      end
      while not @best_versions.empty? and @best_versions[0][1] < count
        @best_versions.delete_at(0)
      end
      if count != 0 and (@best_versions.empty? or @best_versions[0][1] == count) and \
        not @best_versions.include? [version[0], count]
        @best_versions.insert(0, [version[0], count])
      end
    end
    
    @got_best_versions = true
    @best_versions.flatten!

    @best_versions.each_index{|i| @best_versions.delete_at(i + 1)}.sort!
    
    @best_versions
  end
  
  def matches_format
    if @got_best_versions == false
        self.best_matches
    end
    @best_versions
  end
end
