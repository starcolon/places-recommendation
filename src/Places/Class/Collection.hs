module Places.Class.Collection where

import Data.List
import Data.HashMap.Strict
import Data.Trees.KdTree as Kd
import Places.Class.Data
import Places.Geo.Utils

-- | Implements [Place] as a KdTree's [Point] instance
instance Kd.Point Place where
  dimension _ = 2
  coord 0 p   = lat p
  coord 1 p   = lng p
  coord _ p   = error "Lat/Lng coordinate out of range"
  dist2 p1 p2 = distance (lat p1, lng p1) (lat p2, lng p2)


class Groupable a where -- TAOTODO: Need to redesign
  group :: a -> HashMap b a 
  join  :: HashMap b a -> HashMap b a -> HashMap b a


class Filterable a where
  takeIf    :: (b -> Bool) -> a -> a
  takeWhile :: (b -> Bool) -> a -> a


