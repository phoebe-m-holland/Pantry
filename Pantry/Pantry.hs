module Pantry.Pantry
(
  Pantry(..)
 ,addIngredient
) where

import qualified Data.Set as Set
import Pantry.Ingredient (Ingredient)

data Pantry		= Larder	{ contents::Set.Set Ingredient
							} deriving (Show)

addIngredient :: Pantry -> Ingredient -> Pantry
addIngredient (Larder {contents=c}) i =
	Larder $ Set.insert i $ c

--addIngredients p is :: Pantry -> [Ingredient] -> Pantry
--addingredients p is = 


