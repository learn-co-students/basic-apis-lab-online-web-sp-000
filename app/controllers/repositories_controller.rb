class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '3dc0b9f4b1ced904eff9'
      req.params['client_secret'] = '57d15b20b51d62cd2329faede5b40a669adc7cb6'
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]

    render 'search'
  end

end
