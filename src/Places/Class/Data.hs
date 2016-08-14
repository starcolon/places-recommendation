module Places.Class.Data (

  Place,
  showPlace,
  fromList

) where

import Data.List

-- address,category,id,lat,lng,location,
-- name,originalId,polarity,subCategory,
-- details,reviews
data Place = 
  Place { address     :: String
        , category    :: String
        , _id         :: Integer
        , lat         :: Double
        , lng         :: Double
        , location    :: String
        , name        :: String
        , originalId  :: Integer
        , polarity    :: String
        , subCategory :: String
        , details     :: String
        , reviews     :: String
        }

instance Show Place where
  show            = showPlace
  showList places = (++) $ intercalate "\n" (map show places)


showPlace :: Place -> String
showPlace p = let { name'     = name p
                  ; location' = location p
                  ; cate'     = subCategory p
                  ; line      = [name', "(", cate', ") in ", location']
              } in intercalate " " line

fromList :: [String] -> Maybe Place
fromList ns = if length ns < 12 
  then Nothing
  else Just Place { address     = ns !! 0
                  , category    = ns !! 1
                  , _id         = read (ns !! 2) :: Integer
                  , lat         = read (ns !! 3) :: Double
                  , lng         = read (ns !! 4) :: Double
                  , location    = ns !! 5
                  , name        = ns !! 6
                  , originalId  = read (ns !! 7) :: Integer
                  , polarity    = ns !! 8
                  , subCategory = ns !! 9
                  , details     = ns !! 10
                  , reviews     = ns !! 11
      }



