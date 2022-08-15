object @recipe
attributes :uuid, :name, :description, :process
child(:user) { attributes :name, :uuid }
child :recipeIngredients => :ingredients do
    attributes :measurement_type
    attributes :amount, :if => lambda { |_| @unit != 'imperial' }
    attributes :amount_imperial => :amount, :if => lambda { |_| @unit == 'imperial' }
    glue(:ingredient) { attribute :name }
end
child :ratings do
    attributes :rating
    child(:user) { attributes :uuid, :name }
end