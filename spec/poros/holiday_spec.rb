require 'rails_helper'

RSpec.describe 'next holiday API' do
  it 'gets current list of soonest holidays' do
    # the API request
    api_request = Faraday.get("https://date.nager.at/api/v2/NextPublicHolidays/US")
    parsed = JSON.parse(api_request.body, symbolize_names: true)

    # calling our method to make the API request
    next_holidays = HolidayFacade.next_holidays

    expect(next_holidays.first.name).to eq(parsed.first[:localName])
  end
end
