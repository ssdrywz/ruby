class TransactionOrdersController < ApplicationController
  before_action :set_transaction_order, only: [:edit, :update, :destroy, :show]

  # GET /transaction_orders
  # GET /transaction_orders.json
  def index
    @transaction_orders = TransactionOrder.all
  end

  # GET /transaction_orders/1
  # GET /transaction_orders/1.json
  def show
    # store_location
    # @transaction_order = TransactionOrder.find_by(params[:id])
  end

  def init_edit
  end

  def do_init_edit
  end

  def pay
  end



  def do_pay
    @transaction_order = TransactionOrder.find(params[:id])
    @user = @transaction_order.user
    respond_to do |format|
      if @transaction_order.amount < @user.money
        @transaction_order.update_attribute(:delivery_state, "已付款")
        @user.update_attribute(:money, @user.money - @transaction_order.amount)
        format.html { redirect_to @transaction_order, notice: 'pay successfully.' }
        format.json { render :show, status: :ok, location: @transaction_order }
      else
        format.html { render :show }
        format.json { render json: @transaction_order.errors, status: :unprocessable_entity }
      end
    end

    # @transaction_order = TransactionOrder.find(params[:id])
    # if @transaction_order.update_attribute(:delivery_state, "已付款")
    #   redirect_to @transaction_order
    # else
    #   redirect_to @transaction_order
    # end
  end

  def do_deliver
    @transaction_order = TransactionOrder.find(params[:id])
    if @transaction_order.update_attribute(:delivery_state, "已发货")
      redirect_to @transaction_order
    else
      redirect_to @transaction_order
    end
  end

  def do_receive
    @transaction_order = TransactionOrder.find(params[:id])
    if @transaction_order.update_attribute(:delivery_state, "已完成")
      redirect_to @transaction_order.user
    else
      redirect_to @transaction_order
    end
  end

  def update_pay
    # if @transaction_order.amount > @user.money
    #   redirect_to @user
    # else
    #   @user.money = @user.money - @transaction_order.amount
    #   @transaction_order.delivery_state = "已付款"
    # redirect_to @user
    # end
  end
  # GET /transaction_orders/new
  def new
    @transaction_order = TransactionOrder.new
  end

  # GET /transaction_orders/1/edit
  def edit
  end

  # POST /transaction_orders
  # POST /transaction_orders.json
  def create
    @user = User.find(params[:user_id])
    @transaction_order = TransactionOrder.new(transaction_order_params)
    @transaction_order.user = @user
    @transaction_order.delivery_state = "未支付"
    @transaction_order.amount = 0
    @transaction_order.save

    @user.active_carts.each { |cart|
      @transaction_order.amount = @transaction_order.amount + cart.price
      #:album_id, :user_id, :price, :number, :transactionOrder_id
      @transaction_item = TransactionItem.create()
      @transaction_item.album = cart.album
      @transaction_item.user = cart.user
      @transaction_item.price = cart.price
      @transaction_item.number = cart.number
      @transaction_item.transactionOrder = @transaction_order
      @transaction_item.save
      cart.destroy
    }
    respond_to do |format|
      if @transaction_order.save
        format.html { redirect_to  @transaction_order, notice: 'Transaction order was successfully created.' }
        format.json { render :edit, status: :created, location: @transaction_order }
      else
        format.html { render "users/show" }
        format.json { render json: @transaction_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_orders/1
  # PATCH/PUT /transaction_orders/1.json
  def update
    respond_to do |format|
      if @transaction_order.update(transaction_order_params)
        format.html { redirect_to @transaction_order, notice: 'Transaction order was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_order }
      else
        format.html { render :edit }
        format.json { render json: @transaction_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_orders/1
  # DELETE /transaction_orders/1.json
  def destroy
    @transaction_order.destroy
    respond_to do |format|
      format.html { redirect_to transaction_orders_url, notice: 'Transaction order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_order

      # if params[:order_id].nil?
      #   @transaction_order = TransactionOrder.find(params[:id])
      # end
      @transaction_order = TransactionOrder.find(params[:id])


      #@transaction_order = TransactionOrder.find(params[:order_id]) if @transaction_order.nil?
    end
    # Only allow a list of trusted parameters through.
    def transaction_order_params
      params.require(:transaction_order).permit(:transaction_item_id, :user_id, :delivery_name, :delivery_address, :delivery_phone, :delivery_postcode, :delivery_state, :amount)
    end
end
