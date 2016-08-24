module Places.Class.Instance where

import           Data.Monoid
import           Places.Class.Data
import qualified Data.Trees.KdTree as Kd-- hiding (fromList)

newtype PlaceTree = PlaceTree (Kd.KdTree Place)

instance PlaceList PlaceTree where
  closest  = findClosest
  whichAre = filterCate

-- | Find [N] closest neighbors of a [Place]
findClosest :: Int -> Place -> PlaceTree -> PlaceTree
findClosest n p (PlaceTree this) = 
  let ps = Kd.toList this
    in PlaceTree $ Kd.fromList $ take n ps

-- | Filter [Place] from the tree of which category matches the argument
filterCate :: String -> PlaceTree -> PlaceTree
filterCate c (PlaceTree this) = 
  let { ps  = Kd.toList this
      ; ps' = filter (\p -> category p == c) ps }
    in PlaceTree $ Kd.fromList $ ps'