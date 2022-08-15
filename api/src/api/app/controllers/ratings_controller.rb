class RatingsController < ActionController::API
  def create
    @user = User.find_by({uuid: params[:user_uuid]})
    @recipe = Recipe.find_by({uuid: params[:recipe_uuid]})

    @rating = Rating.new({user: @user, recipe: @recipe, rating: params[:rating]})

    if @rating.save
      render 'rating/index'
    else
      render :nothing => true, :status => :bad_request
    end
  end
end
