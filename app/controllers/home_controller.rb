class HomeController < ApplicationController
  protect_from_forgery

  def index
    @m_foods = M::Food.all.order("id")
    @orders = Order.where(state: "init").order("id desc").all
    if params[:visible].present?
      visible = params[:visible] == "enable" ? true : false
      M::Food.find(params[:food_id]).update_attributes(visibility: visible)
    end
  end

  def login
    if params[:target] == "sign_out"
      sign_out current_user
    end
    if user_signed_in?
      redirect_to mypage_path
    end
    session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/home/callback')
    @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream")
    puts session.to_s + "<<< session"
    respond_to do |format|
      format.html {  }
    end
  end

  def callback
    if params[:code]
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end

    @api = Koala::Facebook::API.new(session[:access_token])
    begin
      data = @api.get_object("me")
      avatar = @api.get_picture(data["id"])
      @user = User.check_user data
      @user.update_attributes(avatar: avatar) unless @user.avatar
      sign_in @user
      redirect_to mypage_path
    rescue Exception=>ex
      puts ex.message
    end

    respond_to do |format|
     format.html {   }
    end
  end
end
