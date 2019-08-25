class RepositoriesController < ApplicationController

  def search


  end

  def github_search
    clientId = "test"
    secretNum = "test"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["clientId"] = clientId
      req.params["client_secretNum"] = secretNum
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
