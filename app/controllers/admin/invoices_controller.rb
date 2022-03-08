class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:invoice_id])
    @discounts = @invoice.discount_info
    @inv_items = @invoice.items
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(status: params[:status])
    redirect_to "/admin/invoices/#{params[:id]}"
  end

end
