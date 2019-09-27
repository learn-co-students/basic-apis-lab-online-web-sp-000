require "pry"

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '5aff41ab83d2afb2255d'
      req.params['client_secret'] = '659b287a7a08cb0378050a65d1ce5eed35015ded'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repo = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
  end
end
