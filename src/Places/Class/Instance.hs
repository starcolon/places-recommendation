module Places.Class.Instance where

import Places.Class.Data
import Places.Class.Generic

instance Filterable PlaceList where
  takeIf    = takePlaceListIf
  takeWhile = takePlaceListWhile

-- | Take all elements from the [PlaceList]
-- which satisfy the given predicate
takePlaceListIf :: (Place -> Bool) -> PlaceList -> PlaceList
takePlaceListIf f p = p -- TAOTODO: Implement this

-- | Sequentially take the elements from the [PlaceList]
-- and stops as soon as the element no longer satisfies
-- the given predicate
takePlaceListWhile :: (Place -> Bool) -> PlaceList -> PlaceList
takePlaceListWhile f p = p -- TAOTODO: