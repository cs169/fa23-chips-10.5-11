# frozen_string_literal: true
class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    rep_info.officials.each_with_index.map do |official, index|
      process_official(official, index, rep_info)
    end.compact
  end

  def self.process_official(official, index, rep_info)
    ocdid_temp, title_temp = find_office_info(index, rep_info)
    address = official.address.is_a?(Array) ? official.address[0] : official.address
    return unless address

    create_or_find_rep(official, ocdid_temp, title_temp, address)
  end

  def self.find_office_info(index, rep_info)
    ocdid_temp = ''
    title_temp = ''
    rep_info.offices.each do |office|
      if office.official_indices.include? index
        title_temp = office.name
        ocdid_temp = office.division_id
      end
    end
    [ocdid_temp, title_temp]
  end

  def self.create_or_find_rep(official, ocdid_temp, title_temp, address)
    rep_hash = {
      name:      official.name, ocdid:     ocdid_temp,
      title:     title_temp, address:   address.line1,
      city:      address.city, state:     address.state,
      zip:       address.zip, party:     official.party,
      photo_url: official.photo_url
    }
    Representative.find_by(rep_hash) || Representative.create!(rep_hash)
  end
end