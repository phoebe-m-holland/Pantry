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
											"Sour cream"	 ]	),
										("Pasta with cheese",[
											"Pasta",
											"Cheese",
											"Garlic"		 ]	),
										("Some third thing", [
											"Blueberries",
											"Sour cream",
											"A live cat"	 ]	)	]
	print p
	print r
	print $ map (missingFewerThan 2 p) r
