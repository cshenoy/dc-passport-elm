module Models exposing (..)

import Json.Encode as E exposing (Value)

-- MODEL
type alias Model =
  { venues : List Venue
  , visibility : String
  , gmap : Value
  }

type alias Venue =
  { name : String
  , neighborhood : String
  , visited : Bool
  , offer : String
  , id : Int
  , coords: Coords
  }

type alias Coords =
  { lat: Float
  , lng: Float
  }

initialModel : Model
initialModel = 
  { venues = []
  , visibility = "All"
  , gmap = E.string "to be replaced by google map"
  }