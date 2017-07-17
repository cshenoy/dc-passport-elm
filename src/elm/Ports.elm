port module Ports exposing (..)

import Json.Encode as E exposing (Value)

import Models exposing (..)

-- Ports : Outgoing

port loadMap : Coords -> Cmd msg

port setMarkers : Model -> Cmd msg


-- Ports: Incoming

port receiveMap : (Value -> msg) -> Sub msg