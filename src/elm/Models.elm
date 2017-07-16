module Models exposing (..)

-- MODEL
type alias Model =
  { venues : List Venue
  , visibility : String
  }

type alias Venue =
  { name : String
  , neighborhood : String
  , visited : Bool
  , offer : String
  , id : Int
  }
  --, coords: Coords

--type alias Coords =
--  { lat: Int
--  , lng: Int
--  }

initialModel : Model
initialModel = 
  { venues = []
  , visibility = "All"
  }