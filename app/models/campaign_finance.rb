# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  # method to get top 20

  def self.get_top_twenty(cycle, category)
    # get the api key from credentials
    api_key = service.key = Rails.application.credentials[:PROPUBLICA_API_KEY]

    # construct the url for the api call
    url = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}"

    # create connection object to add the api key to the header
    connection = Faraday.new do |faraday|
      faraday.headers['X-API-Key'] = api_key
    end

    connection.get url
  end
end
