class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |request|
      request.params['client_id'] = 'CLIENTID'
      request.params['client_secret'] = 'CLIENTSECRET'
      request.params['q'] = params[:query]
    end
    hash = JSON.parse(@response.body)
    if @response.success?
      @repos = hash["items"]
    end
    render 'search'
  end
end
