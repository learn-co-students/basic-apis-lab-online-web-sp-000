class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.bfb1677879a9db85"
    secret = "524b4dffa6e19ab22ee2f1f6ee89350e3a967ef9"

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
