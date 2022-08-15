collection @recipes
attribute :name, :description, :user
child(:user) { attributes :name, :uuid }