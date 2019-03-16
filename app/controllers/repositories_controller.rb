class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = 'a984cf970efd354666aa'
      req.params["client_secret"] = 'ff033a803e24525399bb7577d6cf588cba0ae32f'
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
