module Places.Geo.Utils where

-- | Geospatial distance between 2 locations
distance :: (Double, Double) -> (Double, Double) -> Double
distance (i1,j1) (i2,j2) = 
  let { dlat  = 111540 * (i1-i2)
      ; dlng  = 111320 * (cos i1) * (j2-j1)
      ; dlat2 = dlat ** 2
      ; dlng2 = dlng ** 2
  } in sqrt $ dlat2 + dlng2

-- | Test whether a two locations lie within a specified distance
-- from each other
inRange :: Double -> (Double, Double) -> (Double, Double) -> Bool
inRange d p1 p2 = d > distance p1 p2


