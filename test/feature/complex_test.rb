require "test_case"

class ComplexTest < Feature::TestCase
  def test_complex
    n = 5000
    puts "Testing rendering of #{n} cached complex templates"
    Benchmark.bm do |bm|
      bm.report("raw") { for i in 1..n; get "/complex/raw"; end }
      bm.report("erb") { for i in 1..n; get "/complex/erb"; end }
      bm.report("haml") { for i in 1..n; get "/complex/haml"; end }
      bm.report("rblade") { for i in 1..n; get "/complex/rblade"; end }
      bm.report("slim") { for i in 1..n; get "/complex/slim"; end }
    end

    assert true
  end

  def test_complex_no_cache
    n = 1000
    puts "Testing compilation and rendering of #{n} complex templates"
    Benchmark.bm do |bm|
      bm.report("raw") { for i in 1..n; get_uncached "/complex/raw"; end }
      bm.report("erb") { for i in 1..n; get_uncached "/complex/erb"; end }
      bm.report("haml") { for i in 1..n; get_uncached "/complex/haml"; end }
      bm.report("rblade") { for i in 1..n; get_uncached "/complex/rblade"; end }
      bm.report("slim") { for i in 1..n; get_uncached "/complex/slim"; end }
    end

    assert true
  end
end
