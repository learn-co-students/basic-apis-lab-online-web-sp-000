class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}' do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params['query']
    end

    body = JSON.parse(@resp.body)
    @responses = body['items']
    render 'search'
  end
end
