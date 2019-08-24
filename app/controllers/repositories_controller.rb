class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |request|
        request.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = "There was an error"
      end
    rescue Faraday::ConnectionFailed
      @error = "Your request timed out. Please try again"
    end
    render 'search'
  end

end
