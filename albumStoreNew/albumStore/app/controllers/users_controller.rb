class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.role=="用户"
      @user.role = "customer"
    else
      @user.role = "manager"
    end
    @user.money = 0
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow(other_album_id)
    active_likes.create(album_id: other_album_id)
  end

  # 取消关注另一个用户
  def unfollow(other_album_id)
    active_likes.find_by(album_id: other_album_id).destroy
  end

  # 如果当前用户关注了指定的用户，返回 true
  def following?(other_album_id)
    albums.include?(other_album_id)
  end

  def login

  end

  def do_login
    user = User.where(name: params[:name],
                      password: params[:password]).first
    if user
      session[:current_userid] = user.id
      # redirect_to albums_url, notice: 'User login successfully.'
      redirect_back_or albums_url
    else
      redirect_to login_users_url, alert: 'Wrong username or password!'
    end
  end

  def add_credit
    @user = User.find(params[:id])
    if @user.update_attribute(:money,  params[:money].to_i + @user.money.to_i)
      redirect_to @user
    else
      redirect_to albums_url
    end
  end

  def logout
    session.delete(:current_userid)
    redirect_to albums_url, alert: 'User logout successfully!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :role, :email, :money, :picture, :deliveryaddress, :deliveryname, :deliveryphone, :deliverypostcode, :cridet)
    end
end