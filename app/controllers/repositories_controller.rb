class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	client_id = "9ae82c6aef0eadf32145"
  	client_secret = "682a87b763f24f9e99d742a008ead3e8461bd3e2"

  	resp = Faraday.get "https://api.github.com/search/repositories" do |req|
  		req.params["q"] = params[:query]
  		req.params["client_id"] = client_id
  		req.params["client_secret"] = client_secret
  	end

  	body = JSON.parse(resp.body)
  	@results = body["items"]
  	render :search

 
  end
end
