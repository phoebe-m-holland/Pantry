module Pantry.Pantry
(
  Pantry(..)
 ,addIngredient
) where

import qualified Data.Set as Set
import Pantry.Ingredient (Ingredient)

data Pantry		= Pantry	{ contents::Set.Set Ingredient
							} deriving (Show)

addIngredient :: Pantry -> Ingredient -> Pantry
addIngredient (Pantry {contents=c}) i =
	Pantry $ Set.insert i $ c

--addIngredients p is :: Pantry -> [Ingredient] -> Pantry
--addingredients p is = 


