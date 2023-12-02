# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index; end

  def search
    unless (params[:category] and params[:cycle])
      redirect_to '/campaign_finance'
    end
  end
end
