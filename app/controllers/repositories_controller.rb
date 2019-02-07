class RepositoriesController < ApplicationController

  def search
    render 'search'
  end

  def github_search
    res = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'fb485c4d11bbd817efcb'
      req.params['client_secret'] = 'a2c1e6cfc1fe7b279e0557de5254baa0399d9319'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(res.body)
    @items = body["items"]
  render 'search'
  end
end
end
