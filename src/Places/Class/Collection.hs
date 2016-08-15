module Places.Class.Collection where

import Data.List
import Data.HashMap.Strict
import Data.Trees.KdTree as Kd
import Places.Class.Data

class Groupable a where
  groupBy :: b -> a -> HashMap b a

class Filterable a where
  takeIf    :: (b -> Bool) -> a -> a
  takeWhile :: (b -> Bool) -> a -> a


-- | Implements [Place] as a KdTree's [Point] instance
instance Kd.Point Place where
  dimension _ = 2
  coord 0 p   = lat p
  coord 1 p   = lng p
  coord _ p   = error "Lat/Lng coordinate out of range"
  dist2 p1 p2 = error "TAOTODO: Implement a geospatial distance"

newtype Places = KdTree Place
