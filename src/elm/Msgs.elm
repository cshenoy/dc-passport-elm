module Msgs exposing (..)

import Http
import Models exposing (Venue)

type Msg
  = NoOp
  | GetInfo
  | FetchAllDone (Result Http.Error (List Venue))