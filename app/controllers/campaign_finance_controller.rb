# frozen_string_literal: true

class CampaignFinanceController < ApplicationController
  def index; end

  def search
    redirect_to '/campaign_finance' unless params[:category] && params[:cycle]

    # fixme: invalid cycles, categories
    cycle = params[:cycle]
    category = params[:category].downcase.sub(' ', '-')

    @campaign_finance = CampaignFinance.get_top_twenty(cycle, category)

    format_table(category)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def format_table(category)
    case category
    when 'candidate-loan'
      @category = 'candidate_loans'
      @header = 'Candidate Loans'
    when 'contribution-total'
      @category = 'total_contributions'
      @header = 'Total Contributions'
    when 'debts-owed'
      @category = 'debts_owed'
      @header = 'Debts Owed'
    when 'disbursements-total'
      @category = 'total_disbursements'
      @header = 'Total Disbursements'
    when 'end-cash'
      @category = 'end_cash'
      @header = 'End Cash'
    when 'individual-total'
      @category = 'total_from_individuals'
      @header = 'Total From Individuals'
    when 'pac-total'
      @category = 'total_from_pacs'
      @header = 'Total From PACs'
    when 'receipts-total'
      @category = 'begin_cash'
      @header = 'Reciepts Total'
    when 'refund-total'
      @category = 'total_refunds'
      @header = 'Refund Total'
    end
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/MethodLength
  end
end
