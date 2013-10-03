module Pantry.Ingredient
(
  Ingredient(..)
) where

data Ingredient = Ingredient	{ name::String 
								} deriving (Eq, Ord, Show)


