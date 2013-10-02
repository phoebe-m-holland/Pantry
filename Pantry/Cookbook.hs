module Pantry.Cookbook
(
  Cookbook
) where

import Pantry.Recipe (Recipe)

data Cookbook	= Cookbook		{ contents::[Recipe]
								} deriving (Show)


