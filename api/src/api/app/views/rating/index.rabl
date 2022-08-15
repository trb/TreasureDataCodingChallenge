object @rating
attributes :rating
child(:recipe) { attributes :uuid }
child(:user) { attributes :uuid }