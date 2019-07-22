class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
    req.params["q"] = params[:query]
    req.params["client_id"] = "xxxx&client_secret=yyyy"
    req.params["client_secret"] = "cf774b1539e3eaa12d9a89466acd7e179491293f"
  end

  body = JSON.parse(resp.body)
  @results = body["items"]
  render :search
  end
end
