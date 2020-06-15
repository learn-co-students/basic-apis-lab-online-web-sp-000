class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "2484d396378785d6"
    secret = "0eebb9b9d49fe99264914a6dbe5709c169625031"
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end
    body = JSON.parse(resp.body)
    @search_results = body["items"]
    render :search
  end
end
