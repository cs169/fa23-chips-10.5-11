# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      rep_hash = { 
      name: official.name, 
      ocdid: ocdid_temp,
      title: title_temp,
      address: official.address[0].line1,
      city: official.address[0].city,
      state: official.address[0].state,
      zip: official.address[0].zip,
      party: official.party,
      photo_url: official.photo_url
      }

      rep ||= Representative.find_by(rep_hash)
      rep ||= Representative.create!(rep_hash) unless rep
      reps.push(rep)
    end

    reps
  end
end
