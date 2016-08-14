module Places.Class.Data (

  Place,
  showPlace,
  fromList

) where

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
  show = showPlace


showPlace :: Place -> String
showPlace p = let { name'     = name p
                  ; location' = location p
                  ; cate'     = subCategory p
                  ; line      = [name', "(", cate', ") in ", location']
              } in unlines line

fromList :: [String] -> Place
fromList [a1:a2:a3:a4:a5:a6:a7:a8:a9:a10:a11:a12] = 
  Place { address     = a1
        , category    = a2
        , _id         = read a3 :: Integer
        , lat         = read a4 :: Double
        , lng         = read a5 :: Double
        , location    = a6
        , name        = a7
        , originalId  = read a8 :: Integer
        , polarity    = a9
        , subCategory = a10
        , details     = a11
        , reviews     = a12
  }

