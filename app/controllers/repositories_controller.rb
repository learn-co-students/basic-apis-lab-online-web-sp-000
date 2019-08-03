class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.fc130a0ca9fa8746'
      req.params['client_secret'] = '6a8509cabbf8c0ed6cfe7617539739c6ee1f2c87'
      req.params["q"] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
