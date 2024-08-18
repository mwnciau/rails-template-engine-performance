require "test_case"

class PartialsTest < Feature::TestCase
  def test_partials
    n = 5000
    puts "Testing rendering of #{n} cached templates with partials"
    Benchmark.bm do |bm|
      bm.report("raw") { for i in 1..n; get "/partials/raw"; end }
      bm.report("erb") { for i in 1..n; get "/partials/erb"; end }
      bm.report("haml") { for i in 1..n; get "/partials/haml"; end }
      bm.report("rblade") { for i in 1..n; get "/partials/rblade"; end }
      bm.report("slim") { for i in 1..n; get "/partials/slim"; end }
    end

    assert true
  end

  def test_partials_no_cache
    n = 1000
    puts "Testing compilation and rendering of #{n} templates with partials"
    Benchmark.bm do |bm|
      bm.report("raw") { for i in 1..n; get_uncached "/partials/raw"; end }
      bm.report("erb") { for i in 1..n; get_uncached "/partials/erb"; end }
      bm.report("haml") { for i in 1..n; get_uncached "/partials/haml"; end }
      bm.report("rblade") { for i in 1..n; get_uncached "/partials/rblade"; end }
      bm.report("slim") { for i in 1..n; get_uncached "/partials/slim"; end }
    end

    assert true
  end
end
