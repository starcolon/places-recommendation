module Places.Class.Instance where

import Places.Class.Data
import Places.Class.Definition

instance Filterable PlaceList where
  takeIf    = takePlaceListIf
  takeWhile = takePlaceListWhile

takePlaceListIf :: (Place -> Bool) -> PlaceList -> PlaceList
takePlaceListIf f p = p -- TAOTODO: Implement this