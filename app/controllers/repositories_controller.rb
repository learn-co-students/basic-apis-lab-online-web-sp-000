class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories")  do |req|
         req.params['q'] = params[:query]
         req.params['client_id'] = ENV['GIT_CLIENT_ID']
         req.params['client_secret'] = ENV['GIT_CLIENT_SECRET']

     end

     result = JSON.parse(@resp.body)
     @body = result["items"]
     
    render 'search'
  end
end
