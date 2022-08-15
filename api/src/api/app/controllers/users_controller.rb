class UsersController < ActionController::API
  def create
    @user = User.new(name: params[:name], email: params[:email])

    if @user.save
      render 'users/index'
    else
      render :nothing => true, :status => :bad_request
    end
  end
end
