module Main exposing (..)

import Html exposing (..)
import Time exposing (Time)
import Task

import Commands exposing (fetchVenues)
import Models exposing (..)
import Msgs exposing (Msg(..))
import Updates exposing (update)
import Views exposing (view)
import Ports exposing (receiveMap)

-- component import example
--import Components.Restaurant exposing ( restaurant )

-- Init
init : ( Model, Cmd Msg )
init =
    ( initialModel
    , Cmd.batch
      [ fetchVenues
      , Time.now |> Task.perform Tick
      ]
    )

subscriptions : Model -> Sub Msg
subscriptions model =
  receiveMap JSMap

-- APP
main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }