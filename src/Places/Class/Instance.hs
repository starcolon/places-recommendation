module Places.Class.Instance where

import           Data.Monoid
import           Places.Class.Data
import qualified Data.Trees.KdTree as Kd-- hiding (fromList)

newtype PlaceTree = KdTree Place

instance PlaceList PlaceTree where
  closest  = findClosest
  whichAre = filterCate


findClosest :: Int -> Place -> PlaceTree
findClosest = error "TAOTODO: Implement this"

filterCate :: String -> PlaceTree
filterCate = error "TAOTODO: Implement this"