class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'YXNP1TNTA5HDS4BPAMOE11P12Y5AJ5V5F3VAYYVAILQYL5A4'
      req.params['client_secret'] = 'BSZKKACM0DS5QWD4X3BLENODQFHUEJJUUUQFN4GOH2G1IVR5'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
