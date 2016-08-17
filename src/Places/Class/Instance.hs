module Places.Class.Instance where

import Places.Class.Data
import Places.Class.Generic

instance Filterable PlaceList where
  takeIf    = takePlaceListIf
  takeWhile = takePlaceListWhile

takePlaceListIf :: (Place -> Bool) -> PlaceList -> PlaceList
takePlaceListIf f p = p -- TAOTODO: Implement this

takePlaceListWhile :: (Place -> Bool) -> PlaceList -> PlaceList
takePlaceListWhile f p = p -- TAOTODO: