class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    url = 'https://api.github.com/search/repositories?q=' + params[:query]
    @resp = Faraday.get url do |req|
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
    end
    body_hash = JSON.parse(@resp.body)
    @item_info = []
    body_hash["items"].each do |item|
      @item_info<< {link: item["html_url"],  description: item["description"]}
    end    
    render 'search' 
  end
end
