module Updates exposing (..)

import Http

import Models exposing (..)
import Msgs exposing (Msg(..))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    GetInfo ->
      ( model, Cmd.none )
    FetchAllDone res ->
      case res of
        Result.Ok newVenues ->
          { model
            | venues = newVenues
          } ! []
        Result.Err _ ->
          ( model, Cmd.none )