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

  def new
    @merchant = Merchant.find(params[:id])
  end

  def create
    merchant = Merchant.find(params[:id])
    discount = merchant.discounts.create(discount_params)

    if discount.save
      redirect_to "/merchants/#{merchant.id}/discounts"
    else
      redirect_to "/merchants/#{merchant.id}/discounts/new"
      flash[:alert] = "Error: #{error_message(discount.errors)}"
    end
  end

  private
    def discount_params
      params.permit(:name, :percent, :min_quantity)
    end
end
