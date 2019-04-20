class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      # req.params['client_id'] = '21b6e55c28341e4534d1'
      # req.params['client_secret'] = '6b7c3784af8fde26daa8a3cece36bffdb2a4b75e'
      req.params['q'] = 'tetris'
    end
    @repos = body_hash = JSON.parse(@resp.body)
    render 'search'
  end

end
