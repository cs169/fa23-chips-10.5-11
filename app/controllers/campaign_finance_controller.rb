# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index; end

  def search
    redirect_to '/campaign_finance' unless params[:category] && params[:cycle]

    # fixme: invalid cycles, categories
    cycle = params[:cycle]
    category = params[:category].downcase.sub(' ', '-')

    @campaign_finance = CampaignFinance.get_top_twenty(cycle, category)
    @category = category.sub('-', '_')
  end
end
