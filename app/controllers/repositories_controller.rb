# Client ID: Iv1.cb5b156b02ffe912

# Client secret: 713136a0446c7d74f409d42d429c3b0a0c7e9456


class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = 'Iv1.cb5b156b02ffe912'
          req.params['client_secret'] = '713136a0446c7d74f409d42d429c3b0a0c7e9456'
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @items = body["items"]
        else
          @error = body["meta"]["errorDetail"]
        end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
   render 'search'
  end
end
