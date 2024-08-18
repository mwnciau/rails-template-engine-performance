require "test_case"

class SimpleTest < Feature::TestCase
  def test_simple
    n = 5000
    puts "Testing rendering of #{n} cached simple templates"
    Benchmark.bm do |bm|
      bm.report("raw") { for i in 1..n; get "/simple/raw"; end }
      bm.report("erb") { for i in 1..n; get "/simple/erb"; end }
      bm.report("haml") { for i in 1..n; get "/simple/haml"; end }
      bm.report("rblade") { for i in 1..n; get "/simple/rblade"; end }
      bm.report("slim") { for i in 1..n; get "/simple/slim"; end }
    end

    assert true
  end

  def test_simple_no_cache
    n = 1000
    puts "Testing compilation and rendering of #{n} simple templates"
    Benchmark.bm do |bm|
      bm.report("raw") { for i in 1..n; get_uncached "/simple/raw"; end }
      bm.report("erb") { for i in 1..n; get_uncached "/simple/erb"; end }
      bm.report("haml") { for i in 1..n; get_uncached "/simple/haml"; end }
      bm.report("rblade") { for i in 1..n; get_uncached "/simple/rblade"; end }
      bm.report("slim") { for i in 1..n; get_uncached "/simple/slim"; end }
    end

    assert true
  end
end
