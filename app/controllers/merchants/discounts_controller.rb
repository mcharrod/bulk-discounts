class Merchants::DiscountsController < ApplicationController
  def index
    @holidays = HolidayFacade.next_holidays[0..2]
  end
end
