import Pantry
import Data.Set(fromList)
main = do
	let p = Larder (fromList [Food "this"])
	print p
