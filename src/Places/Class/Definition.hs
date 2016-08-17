module Places.Class.Definition where

import Data.HashMap.Strict

class Groupable a where
  group :: (a -> b) -> a -> HashMap b a 
  join  :: HashMap b a -> HashMap b a -> HashMap b a

class Filterable a where
  takeIf    :: (b -> Bool) -> a -> a
  takeWhile :: (b -> Bool) -> a -> a
