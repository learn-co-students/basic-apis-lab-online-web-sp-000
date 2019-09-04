class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'string'
        req.params['client_secret'] = 'string'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["message"]#["errors"]
      end
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
  
      render 'search'
  end
end
