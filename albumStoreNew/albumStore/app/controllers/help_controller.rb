class HelpController < ApplicationController
  def do_pay
    @transaction_order = TransactionOrder.find(params[:order_id])
    if @transaction_order.update_attribute(:delivery_state, "已付款")
      respond_to current_user
    else
      redirect_to @transaction_order
    end
  end
end
