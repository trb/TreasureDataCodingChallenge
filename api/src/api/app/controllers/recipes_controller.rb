class RecipesController < ActionController::API
  def create
    @user = User.where(:uuid => params[:user]).first
    @recipe = Recipe.new({
                           name: params[:name],
                           description: params[:description],
                           process: params[:process]
                         })
    @recipe.user = @user
    unless @recipe.save!
      render :nothing => true, :status => :bad_request and return
    end

    _handle_ingredients(@recipe, params[:ingredients])

    # ensure the new ingredients are available
    @recipe.reload

    render 'recipes/full'
  end

  def index
    @recipes = Recipe.all

    render 'recipes/condensed'
  end

  def show
    @recipe = Recipe.find_by({ uuid: params[:recipeUuid] })
    @unit = params[:unit]

    logger.info('u')
    logger.info(@unit)

    render 'recipes/full'
  end

  def update
    @recipe = Recipe.find_by({ uuid: params[:recipeUuid] })

    @recipe.update({ name: params[:name], description: params[:description], process: params[:process] })

    @recipe.recipeIngredients.destroy_all

    @recipe.save!

    _handle_ingredients(@recipe, params[:ingredients])

    @recipe.reload

    render 'recipes/full'
  end

  def destroy
    @recipe = Recipe.find_by({uuid: params[:recipeUuid]})

    @recipe.recipeIngredients.destroy_all
    @recipe.ratings.destroy_all
    @recipe.destroy

    head :no_content
  end

  private

  def _handle_ingredients(recipe, ingredients)
    logger.info(ingredients)
    ingredients.each do |ingredient|
      amount, type = begin
                       [Measured::Weight.parse(ingredient[:amount]).convert_to('g'), 'weight']
                     rescue Measured::UnitError
                       begin
                         [Measured::Volume.parse(ingredient[:amount]).convert_to('l'), 'volume']
                       rescue Measured::UnitError
                         [ingredient[:amount], 'count']
                       end
                     end
      ingredientRecord = Ingredient.where(:name => ingredient[:name]).first
      unless ingredientRecord
        ingredientRecord = Ingredient.new(:name => ingredient[:name])
        ingredientRecord.save!
      end

      recipeIngredient = RecipeIngredient.new({ amount: amount, measurement_type: type })
      recipeIngredient.ingredient = ingredientRecord
      recipeIngredient.recipe = recipe

      recipeIngredient.save!
    end
  end
end