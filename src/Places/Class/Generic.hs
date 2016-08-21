module Places.Class.Generic (
  Groupable(..)
, Filterable(..)
) where

import Data.HashMap.Strict
import Places.Class.Data

class Groupable a where 
  group :: (a -> Place) -> a -> HashMap Place a 
  join  :: HashMap Place a -> HashMap Place a -> HashMap Place a

class Filterable a where
  takeIf    :: (Place -> Bool) -> a -> a
  takeWhile :: (Place -> Bool) -> a -> a
