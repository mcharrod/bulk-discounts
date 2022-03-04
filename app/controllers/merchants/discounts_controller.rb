class Merchants::DiscountsController < ApplicationController
  def index
    merchant = Merchant.find(params[:id])
    @discounts = merchant.discounts
    @holidays = HolidayFacade.next_holidays[0..2]
  end
end
