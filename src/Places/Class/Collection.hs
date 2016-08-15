module Places.Class.Collection where

import Data.List
import Data.Trees.KdTree

-- | Mapping of places and their geospatial location
class PlaceMap m where

  -- Filtering the places with a boolean predicate
  filter :: m -> (p -> Bool) -> m


-- | Implementation of Places
instance PlaceMap [Place] where
  filter = filterPlaces


-- | Filter a list of [Place]
filterPlaces :: Place p => [p] -> (p -> Bool) -> [p]
filterPlaces places f = filter f places