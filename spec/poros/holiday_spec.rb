require 'rails_helper'

RSpec.describe 'next holiday API' do
  it 'prints 3 holidays' do
    expect(HolidayFacade.next_holidays).to eq(3)
  end
end
