--Key functions and predicates for searching, filtering, and sorting the pantry

module Pantry.Key
(
	recipesInPantry
	,filterWithEach
	,missingElements
	,missingFewerThan
) where

import Pantry.Recipe
import Pantry.Pantry
import qualified Data.Set as Set
import GHC.Exts (sortWith)
recipesInPantry :: [(Pantry -> Recipe -> Bool)] -> (Pantry -> Recipe -> Int) -> Pantry -> ([Recipe] -> [Recipe])
recipesInPantry predicates sortKey pantry recipes =
	sortWith (sortKey pantry) (filterWithEach (map ($ pantry) predicates) recipes)

filterWithEach :: [(a -> Bool)] -> [a] -> [a]
filterWithEach predicates xs =
	foldl (\acc p -> filter p acc) xs predicates


missingElements :: Pantry -> Recipe -> Int
missingElements (Pantry c) (Recipe n r) =
	foldl (\acc i -> if not $ Set.member i c then acc + 1 else acc) 0 r

missingFewerThan :: Int -> Pantry -> Recipe -> Bool
missingFewerThan n pantry recipe = (missingElements pantry recipe) < n
