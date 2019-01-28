class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.b6d85801bcdb820a'
      req.params['client_secret'] = '481c4a5cdc8e0f4542ff1c1956d57b17a4fe85f4'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@response.body)
    if @response.success?
      @repos = body['items']
    else
      @error = "There was an error."
    end
    render 'search'
  end
end
