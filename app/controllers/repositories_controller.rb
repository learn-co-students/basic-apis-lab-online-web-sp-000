class RepositoriesController < ApplicationController
  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.af2b8cb31ae9831d'
      req.params['client_secret'] = 'd71b98f39692a39f4984c93c8aa1de00f7ca3881'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end