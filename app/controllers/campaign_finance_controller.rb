# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index; end

  def search
    redirect_to '/campaign_finance' unless params[:category] && params[:cycle]
  end
end
