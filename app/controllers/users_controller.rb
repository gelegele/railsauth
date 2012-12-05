class UsersController < AuthController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_url, :notice => "Signed Up!"
    else
      render "new"
    end
  end

  def index
    @users = User.all
  end
end
