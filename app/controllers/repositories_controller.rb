require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ''
      req.params['client_secret'] = ''
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body["items"]
    end
    render 'search'

  end
end
