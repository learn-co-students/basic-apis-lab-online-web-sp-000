class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 184cb799b532da6abc46
      req.params['client_secret'] = 49a641476f0b0ac09847dc7e9bd435f4d7c15ec6
      req.params['q'] = params[:query]
  end
  hash = JSON.parse(@resp.body)
  if @resp.success?
    @repos = hash['items']
  end
  render 'search'
end
