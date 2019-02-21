class RepositoriesController < ApplicationController

  require_relative '../../env'
  def search

  end

  def github_search
    @res = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
    end
    body = JSON.parse @res.body
    if @res.success?
      @items = body['items']
    else 
      @error = body['meta']['errorDetail']
    end
    render 'search'
  end
end
