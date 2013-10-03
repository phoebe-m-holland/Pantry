import Pantry.Pantry
import Pantry.Recipe
import Pantry.Ingredient
import Pantry.Key
import Data.Set(fromList)
----------------------------------------------------------------------

----------------------------------------------------------------------
main = do
	let p = Pantry $ fromList $ map Ingredient ["Avocado",
												"Garlic",
												"Sour cream",
												"Cheese"]

	let	r =  map (\(n, xs) -> Recipe n (map Ingredient xs))
										[("Guacamole",		 [
											"Avocado",
											"Garlic",
											"Sour cream",
											"Jalepeno"]	),
										("Pasta with cheese",[
											"Pasta",
											"Cheese",
											"Pepper",
											"Garlic"		 ]	),
										("Some third thing", [
											"Blueberries",
											"Sour cream",
											"Miso",
											"Live cat"	 ]	),
										("Cheese meal!",	 [
											"Cheese"		 ]  )]
	mapM print (recipesInPantry [(\p i -> (missingElements p i) < 3)] missingElements p r)
