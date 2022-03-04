class Merchants::DiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @discounts = @merchant.discounts
    @holidays = HolidayFacade.next_holidays[0..2]
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.discounts.find(params[:discount_id])
  end
end
