module Pantry.Ingredient
(
  Ingredient(..)
) where

data Ingredient = Food	{ name::String 
						} deriving (Eq, Ord, Show)


