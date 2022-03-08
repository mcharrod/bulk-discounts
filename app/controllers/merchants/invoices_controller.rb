class Merchants::InvoicesController < ApplicationController
  before_action :merchant

  def index
    @merch_invoice = @merchant.invoices.distinct
  end

  def show
    @invoice = Invoice.find(params[:invoice_id])
    @discounts = @invoice.discount_info
  end

  def update
    @inv_item = InvoiceItem.find(params[:invoice_item])
    @inv_item.update(status: params[:status])

    redirect_to "/merchants/#{params[:merchant_id]}/invoices/#{params[:invoice_id]}"

  end
  private

    def merchant
      @merchant = Merchant.find(params[:merchant_id] || params[:id])
    end

end
