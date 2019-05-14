require 'pry'

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '4b50236d374a0e31f79a'
        req.params['client_secret'] = '6689483bb2e1e741d35d02bcb81f2f4e83c419e5'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      @repos = body["items"]
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
