class FramgiaersController < ApplicationController
  before_filter :checking_user
  def index
    @users = User.all.order("amount DESC")
    if params[:apply] == "deliver"
      Order.where(state: "init").all.each do |order|
        order.deliver!
      end
      redirect_to mypage_path
    end
    if params[:apply] == "deliver_one"
      Order.find(params[:order_id]).deliver!
      redirect_to framgiaers_path(show: "show_orders")
    end
    if params[:apply] == "paid"
      Order.find(params[:order_id]).paid!
      redirect_to framgiaers_path(show: "show_orders")
    end
    if params[:show] == "show_orders"
      render :show_orders
    end
  end

  def update
    begin
      user = User.find params[:id]
      user.update_attributes(amount: user.amount + params[:money].to_i)
    rescue
    end
    redirect_to framgiaers_path
  end
  private
  def checking_user
    redirect_to mypage_path unless current_user.try(:is_admin)
  end
end
