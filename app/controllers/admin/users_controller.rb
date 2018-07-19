class Admin::UsersController < Admin::AdminController
  before_action :load_user, only: :show

  def index
    @users = User.all.select(:name, :email, :role).order(created_at: :desc)
      .page(params[:page]).per Settings.user.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "admin.users.success"
      redirect_to request.referrer
    else
      flash[:danger] = t "admin.users.danger"
      render :new
    end
  end

  def show;  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".danger"
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
