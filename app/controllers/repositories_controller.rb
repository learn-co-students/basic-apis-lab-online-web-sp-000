class RepositoriesController < ApplicationController

  def search


  end

  def github_search
    client_id = "4135dc19eb407174e00a"
    secret = "4f7b540b0dc5258f0a55b00bdaca50568a6a6669"

    resp = Faraday.get 'https://api.github.com/search/repositories'do |req|

      req.params['q'] = params[:query]
      req.params['client_id'] = "4135dc19eb407174e00a"
      req.params['client_secret'] = "4f7b540b0dc5258f0a55b00bdaca50568a6a6669"
    end 
    body = JSON.parse(resp.body)
    @results = body["items"]
   render 'search'
  end
end
# q=SEARCH_KEYWORD_1+SEARCH_KEYWORD_N+QUALIFIER_1+QUALIFIER_N