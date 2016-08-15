module Places.Class.Collection where

import Data.List
import Data.Trees.KdTree

-- | Interface design of Indexed collection of [Place]
class IndexedPlaceList m where
  indexes  :: m -> [Int]
  toList   :: m -> [Place]
  fromList :: [Place] -> m


instance IndexedPlaceList [Place] where
  indexes _       = []
  toList places   = places
  fromList places = IndexedPlaceList places