module Updates exposing (..)

import Models exposing (..)
import Msgs exposing (Msg(..))
import Ports exposing (loadMap, setMarkers, scrollToVenue, animateMarker, deanimateMarker)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    JSMap gmap ->
      { model | gmap = gmap } ! []
      --( model, Cmd.none )
    Tick _ ->
      ( model, loadMap (Coords 38.9072 -77.0369) )

    MarkerClick markerId ->
      let
        newModel =
          { model | selected = Just markerId }
      in
        newModel
          ! [ scrollToVenue newModel.selected ]
    GetInfo ->
      ( model, Cmd.none )
    FetchAllDone res ->
      case res of
        Result.Ok newVenues ->
          let
            newModel =
              { model | venues = newVenues }
          in
            newModel ! [ setMarkers newModel ]
        Result.Err _ ->
          ( model, Cmd.none )

    Hover venueId ->
      let
        newModel =
          { model | selected = Just venueId }
      in
        newModel ! [ animateMarker newModel.selected ]

    HoverOff venueId ->
      let
        newModel =
          { model | selected = Just venueId }
      in
        newModel ! [ deanimateMarker newModel.selected ]

    ResetSelected _ ->
      let
        newModel =
          { model | selected = Nothing }
      in
        newModel ! []