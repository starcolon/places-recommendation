module Places.Class.Instance where

import           Data.Monoid
import           Places.Class.Data
import           Places.Geo.Utils
import qualified Data.Trees.KdTree as Kd-- hiding (fromList)

newtype PlaceTree = PlaceTree (Kd.KdTree Place)

instance PlaceList PlaceTree where
  closest  = findNClosest
  ranged   = findClosest
  whichAre = filterCate

instance Show PlaceTree where
  -- show [PlaceTree] will result in showList [List[Place]]
  show (PlaceTree t) = show $ Kd.toList t

-- | Create a new [PlaceTree] from a List of [Place]
placeTree :: [Place] -> PlaceTree
placeTree ps = PlaceTree $ Kd.fromList ps


-- | Find [N] closest neighbors of a [Place]
findNClosest :: Int -> Place -> PlaceTree -> PlaceTree
findNClosest n p (PlaceTree this) = 
  let ps = Kd.toList this
    in PlaceTree $ Kd.fromList $ take n ps

-- | Find closest neighbors of a [Place] which lie within 
-- a specified range
findClosest :: Double -> Place -> PlaceTree -> PlaceTree
findClosest d p (PlaceTree this) = 
  let pos      = (lat p, lng p)
      ps       = Kd.toList this
      inRange' = \d a b -> inRange d a (lat b, lng b)
    in placeTree $ takeWhile (inRange' d pos) ps

-- | Filter [Place] from the tree of which category matches the argument
filterCate :: String -> PlaceTree -> PlaceTree
filterCate c (PlaceTree this) = 
  let { ps  = Kd.toList this
      ; ps' = filter (\p -> category p == c) ps }
    in PlaceTree $ Kd.fromList $ ps'