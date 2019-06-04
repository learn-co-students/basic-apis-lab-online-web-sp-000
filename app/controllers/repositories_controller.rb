class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "2702dbcde3d8a90c5126"
    secret = "4762162c2b3de0ea9e907ceded503700a9dd3d41"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end
    
    body = JSON.parse(resp.body)
    
    @results = body["items"]
    render :search
  end
  
end
