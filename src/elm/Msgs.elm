module Msgs exposing (..)

import Http
import Time exposing (Time)
import Json.Encode as E exposing (Value)

import Models exposing (Venue)

type Msg
  = NoOp
  | GetInfo
  | Tick Time
  | MarkerClick Int
  | JSMap Value
  | FetchAllDone (Result Http.Error (List Venue))
  | Hover Int
  | HoverOff Int
  | ResetSelected (Maybe Int)