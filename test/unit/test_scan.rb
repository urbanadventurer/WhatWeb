##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
require 'minitest/autorun'
require './lib/whatweb'

class WhatWebTest < Minitest::Test

  def setup
    @test_host = 'whatweb.net'
  end

  #
  # @note test public methods
  #
  def test_public_methods
    assert_equal(true, WhatWeb::Scan.public_method_defined?(:scan))
    assert_equal(true, WhatWeb::Scan.public_method_defined?(:add_target))
    assert_equal(true, WhatWeb::Scan.public_method_defined?(:scan_from_plugin))
  end

  #
  # @note test private methods
  #
  def test_private_methods
    assert_equal(true, WhatWeb::Scan.private_method_defined?(:prepare_target))
    assert_equal(true, WhatWeb::Scan.private_method_defined?(:make_target_list))
  end

  def test_invalid_url
    WhatWeb::Scan.new(nil)
    WhatWeb::Scan.new('')
    WhatWeb::Scan.new([])
    WhatWeb::Scan.new({})
    WhatWeb::Scan.new([[]])
    WhatWeb::Scan.new([{}])
  end

  def test_scanner
    scanner = WhatWeb::Scan.new(@test_host)
    assert(scanner)
  end

  def test_scan
    max_redirects = 5
    plugins = PluginSupport.load_plugins
    assert(plugins)

    scanner = WhatWeb::Scan.new(@test_host, max_threads: 25)

    scanner.scan do |target|
      assert(target)
      result = WhatWeb::Parser.run_plugins(target, plugins, scanner: scanner)
      assert(result)

      WhatWeb::Redirect.new(target, scanner, max_redirects)

      whatweb_result = WhatWeb::Parser.parse(target, result)
      assert(whatweb_result[0])
      assert(whatweb_result[1])
      assert_equal('Country', whatweb_result[2].first[0])
    end
  end 
end
