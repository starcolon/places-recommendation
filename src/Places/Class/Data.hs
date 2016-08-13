module Places.Class.Data where

-- address,category,id,lat,lng,location,
-- name,originalId,polarity,subCategory,
-- details,reviews
data Place = Place {
  address     :: String
, category    :: String
, id          :: String
, lat         :: Double
, lng         :: Double
, location    :: String
, name        :: String
, originalId  :: String
, polarity    :: String
, subCategory :: String
, details     :: String
, reviews     :: String
}