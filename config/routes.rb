Rails.application.routes.draw do
  get "/simple/raw", to: "simple#raw"
  get "/simple/erb", to: "simple#erb"
  get "/simple/haml", to: "simple#haml"
  get "/simple/rblade", to: "simple#rblade"
  get "/simple/slim", to: "simple#slim"

  get "/partials/raw", to: "partials#raw"
  get "/partials/erb", to: "partials#erb"
  get "/partials/haml", to: "partials#haml"
  get "/partials/rblade", to: "partials#rblade"
  get "/partials/slim", to: "partials#slim"

  get "/complex/raw", to: "complex#raw"
  get "/complex/erb", to: "complex#erb"
  get "/complex/haml", to: "complex#haml"
  get "/complex/rblade", to: "complex#rblade"
  get "/complex/slim", to: "complex#slim"
end
