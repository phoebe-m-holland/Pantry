module Pantry.Recipe
(
  Recipe(..)
) where

import Pantry.Ingredient (Ingredient)
data Recipe		= Recipe		{ name::String,
								  contents::[Ingredient]
								} deriving (Show)


